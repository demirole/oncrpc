/*********************************************************************
 * RPC for the Windows NT Operating System
 * 1993 by Martin F. Gergeleit
 * Users may use, copy or modify Sun RPC for the Windows NT Operating 
 * System according to the Sun copyright below.
 *
 * RPC for the Windows NT Operating System COMES WITH ABSOLUTELY NO 
 * WARRANTY, NOR WILL I BE LIABLE FOR ANY DAMAGES INCURRED FROM THE 
 * USE OF. USE ENTIRELY AT YOUR OWN RISK!!!
 *********************************************************************/

/* @(#)svc_tcp.c	2.2 88/08/01 4.0 RPCSRC */
/*
 * Sun RPC is a product of Sun Microsystems, Inc. and is provided for
 * unrestricted use provided that this legend is included on all tape
 * media and as a part of the software program in whole or part.  Users
 * may copy or modify Sun RPC without charge, but are not authorized
 * to license or distribute it to anyone else except as part of a product or
 * program developed by the user.
 *
 * SUN RPC IS PROVIDED AS IS WITH NO WARRANTIES OF ANY KIND INCLUDING THE
 * WARRANTIES OF DESIGN, MERCHANTIBILITY AND FITNESS FOR A PARTICULAR
 * PURPOSE, OR ARISING FROM A COURSE OF DEALING, USAGE OR TRADE PRACTICE.
 *
 * Sun RPC is provided with no support and without any obligation on the
 * part of Sun Microsystems, Inc. to assist in its use, correction,
 * modification or enhancement.
 *
 * SUN MICROSYSTEMS, INC. SHALL HAVE NO LIABILITY WITH RESPECT TO THE
 * INFRINGEMENT OF COPYRIGHTS, TRADE SECRETS OR ANY PATENTS BY SUN RPC
 * OR ANY PART THEREOF.
 *
 * In no event will Sun Microsystems, Inc. be liable for any lost revenue
 * or profits or other special, indirect and consequential damages, even if
 * Sun has been advised of the possibility of such damages.
 *
 * Sun Microsystems, Inc.
 * 2550 Garcia Avenue
 * Mountain View, California  94043
 */
#if !defined(lint) && defined(SCCSIDS)
static char sccsid[] = "@(#)svc_tcp.c 1.21 87/08/11 Copyr 1984 Sun Micro";
#endif

/*
 * svc_tcp.c, Server side for TCP/IP based RPC.
 *
 * Copyright (C) 1984, Sun Microsystems, Inc.
 *
 * Actually implements two flavors of transporter -
 * a tcp rendezvouser (a listner and connection establisher)
 * and a record/tcp stream.
 */

#include <stdio.h>
#include <rpc/rpc.h>
#include <errno.h>
#if !defined(WIN32) && !defined(_WIN64)
#include <sys/socket.h>
#endif
#include <errno.h>
#if defined(WIN32) || defined(_WIN64)
int xabort();
#else
extern bool_t abort();
extern errno;
#endif

/*
 * Ops vector for TCP/IP based rpc service handle
 */
static bool_t		svctcp_recv(SVCXPRT *xprt, struct rpc_msg *msg);
static enum xprt_stat	svctcp_stat(SVCXPRT *xprt);
static bool_t		svctcp_getargs(SVCXPRT *xprt, xdrproc_t xdr_args, caddr_t args_ptr);
static bool_t		svctcp_reply(SVCXPRT *xprt, struct rpc_msg *msg);
static bool_t		svctcp_freeargs(SVCXPRT *xprt, xdrproc_t xdr_args, caddr_t args_ptr);
static void		svctcp_destroy(SVCXPRT *xprt);

static struct xp_ops svctcp_op = {
	svctcp_recv,
	svctcp_stat,
	svctcp_getargs,
	svctcp_reply,
	svctcp_freeargs,
	svctcp_destroy
};

/*
 * Ops vector for TCP/IP rendezvous handler
 */
static bool_t		rendezvous_request(SVCXPRT *xprt);
static enum xprt_stat	rendezvous_stat();

static struct xp_ops svctcp_rendezvous_op = {
	rendezvous_request,
	rendezvous_stat,
#if defined(WIN32) || defined(_WIN64)
	xabort,
	xabort,
	xabort,
#else
	abort,
	abort,
	abort,
#endif
	svctcp_destroy
};

static int readtcp(SVCXPRT *, caddr_t, int), writetcp(SVCXPRT *, caddr_t, int );
static SVCXPRT *makefd_xprt(int fd, u_int sendsize, u_int recvsize);

struct tcp_rendezvous { /* kept in xprt->xp_p1 */
	u_int sendsize;
	u_int recvsize;
};

struct tcp_conn {  /* kept in xprt->xp_p1 */
	enum xprt_stat strm_stat;
	u_long x_id;
	XDR xdrs;
	char verf_body[MAX_AUTH_BYTES];
};

/*
 * Usage:
 *	xprt = svctcp_create(sock, send_buf_size, recv_buf_size);
 *
 * Creates, registers, and returns a (rpc) tcp based transporter.
 * Once *xprt is initialized, it is registered as a transporter
 * see (svc.h, xprt_register).  This routine returns
 * a NULL if a problem occurred.
 *
 * If sock<0 then a socket is created, else sock is used.
 * If the socket, sock is not bound to a port then svctcp_create
 * binds it to an arbitrary port.  The routine then starts a tcp
 * listener on the socket's associated port.  In any (successful) case,
 * xprt->xp_sock is the registered socket number and xprt->xp_port is the
 * associated port number.
 *
 * Since tcp streams do buffered io similar to stdio, the caller can specify
 * how big the send and receive buffers are via the second and third parms;
 * 0 => use the system default.
 */
SVCXPRT *
svctcp_create(int sock, u_int sendsize, u_int recvsize)
{
	bool_t madesock = FALSE;
	register SVCXPRT *xprt;
	register struct tcp_rendezvous *r;
	struct sockaddr_in addr;
	int len = sizeof(struct sockaddr_in);

	if (sock == RPC_ANYSOCK) {
#if defined(WIN32) || defined(_WIN64)
		if ((sock = socket(AF_INET, SOCK_STREAM, 0)) == INVALID_SOCKET) {
#else
		if ((sock = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP)) < 0) {
#endif
			perror("svctcp_.c - udp socket creation problem");
			return ((SVCXPRT *)NULL);
		}
		madesock = TRUE;
	}
	bzero((char *)&addr, sizeof (addr));
	addr.sin_family = AF_INET;
	if (bindresvport(sock, &addr)) {
		addr.sin_port = 0;
		(void)bind(sock, (struct sockaddr *)&addr, len);
	}
	if ((getsockname(sock, (struct sockaddr *)&addr, &len) != 0)  ||
	    (listen(sock, 2) != 0)) {
		perror("svctcp_.c - cannot getsockname or listen");
		if (madesock)
#if defined(WIN32) || defined(_WIN64)
		       (void)closesocket(sock);
#else
		       (void)close(sock);
#endif
		return ((SVCXPRT *)NULL);
	}
	r = (struct tcp_rendezvous *)mem_alloc(sizeof(*r));
	if (r == NULL) {
#if defined(WIN32) || defined(_WIN64)
		nt_rpc_report("svctcp_create: out of memory\n");
#else
		(void) fprintf(stderr, "svctcp_create: out of memory\n");
#endif
		return (NULL);
	}
	r->sendsize = sendsize;
	r->recvsize = recvsize;
	xprt = (SVCXPRT *)mem_alloc(sizeof(SVCXPRT));
	if (xprt == NULL) {
#if defined(WIN32) || defined(_WIN64)
		nt_rpc_report("svctcp_create: out of memory\n");
#else
		(void) fprintf(stderr, "svctcp_create: out of memory\n");
#endif
		return (NULL);
	}
	xprt->xp_p2 = NULL;
	xprt->xp_p1 = (caddr_t)r;
	xprt->xp_verf = _null_auth;
	xprt->xp_ops = &svctcp_rendezvous_op;
	xprt->xp_port = ntohs(addr.sin_port);
	xprt->xp_sock = sock;
	xprt_register(xprt);
	return (xprt);
}

/*
 * Like svtcp_create(), except the routine takes any *open* UNIX file
 * descriptor as its first input.
 */
SVCXPRT *
svcfd_create(fd, sendsize, recvsize)
	int fd;
	u_int sendsize;
	u_int recvsize;
{

	return (makefd_xprt(fd, sendsize, recvsize));
}

static SVCXPRT *
makefd_xprt(int fd, u_int sendsize, u_int recvsize)
{
	SVCXPRT *xprt;
	struct tcp_conn *cd;

	xprt = (SVCXPRT *)mem_alloc(sizeof(SVCXPRT));
	if (xprt == (SVCXPRT *)NULL) {
#if defined(WIN32) || defined(_WIN64)
		nt_rpc_report("svc_tcp: makefd_xprt: out of memory\n");
#else
		(void) fprintf(stderr, "svc_tcp: makefd_xprt: out of memory\n");
#endif
		goto done;
	}
	cd = (struct tcp_conn *)mem_alloc(sizeof(struct tcp_conn));
	if (cd == (struct tcp_conn *)NULL) {
#if defined(WIN32) || defined(_WIN64)
		nt_rpc_report("svc_tcp: makefd_xprt: out of memory\n");
#else
		(void) fprintf(stderr, "svc_tcp: makefd_xprt: out of memory\n");
#endif
		mem_free((char *) xprt, sizeof(SVCXPRT));
		xprt = (SVCXPRT *)NULL;
		goto done;
	}
	cd->strm_stat = XPRT_IDLE;
	xdrrec_create(&(cd->xdrs), sendsize, recvsize,
	    (caddr_t)xprt, readtcp, writetcp);
	xprt->xp_p2 = NULL;
	xprt->xp_p1 = (caddr_t)cd;
	xprt->xp_verf.oa_base = cd->verf_body;
	xprt->xp_addrlen = 0;
	xprt->xp_ops = &svctcp_op;  /* truely deals with calls */
	xprt->xp_port = 0;  /* this is a connection, not a rendezvouser */
	xprt->xp_sock = fd;
	xprt_register(xprt);
    done:
	return (xprt);
}

static bool_t
rendezvous_request(SVCXPRT *xprt)
{
	int sock;
	struct tcp_rendezvous *r;
	struct sockaddr_in addr;
	int len;

	r = (struct tcp_rendezvous *)xprt->xp_p1;
    again:
	len = sizeof(struct sockaddr_in);
	if ((sock = accept(xprt->xp_sock, (struct sockaddr *)&addr,
	    &len)) < 0) {
#if defined(WIN32) || defined(_WIN64)
		if (WSAerrno == WSAEINTR)
#else
		if (errno == EINTR)
#endif
			goto again;
	       return (FALSE);
	}
	/*
	 * make a new transporter (re-uses xprt)
	 */
	xprt = makefd_xprt(sock, r->sendsize, r->recvsize);
	xprt->xp_raddr = addr;
	xprt->xp_addrlen = len;
	return (FALSE); /* there is never an rpc msg to be processed */
}

static enum xprt_stat
rendezvous_stat()
{
	return (XPRT_IDLE);
}

static void
svctcp_destroy(SVCXPRT *xprt)
{
	struct tcp_conn *cd = (struct tcp_conn *)xprt->xp_p1;

	xprt_unregister(xprt);
#if defined(WIN32) || defined(_WIN64)
	(void)closesocket(xprt->xp_sock);
#else
	(void)close(xprt->xp_sock);
#endif
	if (xprt->xp_port != 0) {
		/* a rendezvouser socket */
		xprt->xp_port = 0;
	} else {
		/* an actual connection socket */
		XDR_DESTROY(&(cd->xdrs));
	}
	mem_free((caddr_t)cd, sizeof(struct tcp_conn));
	mem_free((caddr_t)xprt, sizeof(SVCXPRT));
}

/*
 * All read operations timeout after 35 seconds.
 * A timeout is fatal for the connection.
 */
static struct timeval wait_per_try = { 35, 0 };

/*
 * reads data from the tcp conection.
 * any error is fatal and the connection is closed.
 * (And a read of zero bytes is a half closed stream => error.)
 */
static int
readtcp(SVCXPRT *xprt, caddr_t buf, int len)
{
	int sock = xprt->xp_sock;
#ifdef FD_SETSIZE
	fd_set mask;
	fd_set readfds;

	FD_ZERO(&mask);
	FD_SET(sock, &mask);
#else
	register int mask = 1 << sock;
	int readfds;
#endif /* def FD_SETSIZE */
	do {
		readfds = mask;
#if defined(WIN32) || defined(_WIN64)
		if (select(0 /* unused in winsock */, &readfds, (int*)NULL, (int*)NULL,
#else
		if (select(_rpc_dtablesize(), &readfds, (int*)NULL, (int*)NULL, 
#endif
			   &wait_per_try) <= 0) {
#if defined(WIN32) || defined(_WIN64)
			if (WSAerrno == WSAEINTR) {
#else
			if (errno == EINTR) {
#endif
				continue;
			}
			goto fatal_err;
		}
#ifdef FD_SETSIZE
	} while (!FD_ISSET(sock, &readfds));
#else
	} while (readfds != mask);
#endif /* def FD_SETSIZE */
#if defined(WIN32) || defined(_WIN64)
	if ((len = recv(sock, buf, len, 0)) > 0) {
#else
	if ((len = read(sock, buf, len)) > 0) {
#endif
		return (len);
	}
fatal_err:
	((struct tcp_conn *)(xprt->xp_p1))->strm_stat = XPRT_DIED;
	return (-1);
}

/*
 * writes data to the tcp connection.
 * Any error is fatal and the connection is closed.
 */
static int
writetcp(SVCXPRT *xprt, caddr_t buf, int len)
{
	int i, cnt;

	for (cnt = len; cnt > 0; cnt -= i, buf += i) {
#if defined(WIN32) || defined(_WIN64)
		if ((i = send(xprt->xp_sock, buf, cnt, 0)) < 0) {
#else
		if ((i = write(xprt->xp_sock, buf, cnt)) < 0) {
#endif
			((struct tcp_conn *)(xprt->xp_p1))->strm_stat =
			    XPRT_DIED;
			return (-1);
		}
	}
	return (len);
}

static enum xprt_stat
svctcp_stat(SVCXPRT *xprt)
{
	register struct tcp_conn *cd =
	    (struct tcp_conn *)(xprt->xp_p1);

	if (cd->strm_stat == XPRT_DIED)
		return (XPRT_DIED);
	if (! xdrrec_eof(&(cd->xdrs)))
		return (XPRT_MOREREQS);
	return (XPRT_IDLE);
}

static bool_t
svctcp_recv(SVCXPRT *xprt, struct rpc_msg *msg)
{
	struct tcp_conn *cd =
	    (struct tcp_conn *)(xprt->xp_p1);
	XDR *xdrs = &(cd->xdrs);

	xdrs->x_op = XDR_DECODE;
	(void)xdrrec_skiprecord(xdrs);
	if (xdr_callmsg(xdrs, msg)) {
		cd->x_id = msg->rm_xid;
		return (TRUE);
	}
	return (FALSE);
}

static bool_t
svctcp_getargs(SVCXPRT *xprt, xdrproc_t xdr_args, caddr_t args_ptr)
{
	return ((*xdr_args)(&(((struct tcp_conn *)(xprt->xp_p1))->xdrs), args_ptr));
}

static bool_t
svctcp_freeargs(SVCXPRT *xprt, xdrproc_t xdr_args, caddr_t args_ptr)
{
	XDR *xdrs =
	    &(((struct tcp_conn *)(xprt->xp_p1))->xdrs);

	xdrs->x_op = XDR_FREE;
	return ((*xdr_args)(xdrs, args_ptr));
}

static bool_t
svctcp_reply(SVCXPRT *xprt, struct rpc_msg *msg)
{
	struct tcp_conn *cd =
	    (struct tcp_conn *)(xprt->xp_p1);
	XDR *xdrs = &(cd->xdrs);
	bool_t stat;

	xdrs->x_op = XDR_ENCODE;
	msg->rm_xid = cd->x_id;
	stat = xdr_replymsg(xdrs, msg);
	(void)xdrrec_endofrecord(xdrs, TRUE);
	return (stat);
}

#if defined(WIN32) || defined(_WIN64)
int xabort()
{
	abort();
}
#endif
