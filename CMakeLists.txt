cmake_minimum_required(VERSION 3.25...3.31)
project(oncrpc VERSION 4.0.0 LANGUAGES CXX C)

add_compile_definitions(_CRT_SECURE_NO_DEPRECATE _CRT_SECURE_NO_WARNINGS _CRT_NONSTDC_NO_DEPRECATE)

add_library(liboncrpc)
set_property(TARGET liboncrpc PROPERTY C_STANDARD 99)

target_sources(liboncrpc
  PUBLIC
  FILE_SET HEADERS
  BASE_DIRS include
  FILES
    include/rpc/AFM_PLATFORM.H
    include/rpc/AUTH.H
    include/rpc/AUTH_UNI.H
    include/rpc/BCOPY.H
    include/rpc/CLNT.H
    include/rpc/NETDB.H
    include/rpc/PMAP_CLN.H
    include/rpc/PMAP_PRO.H
    include/rpc/PMAP_RMT.H
    include/rpc/RPC.H
    include/rpc/RPC_MSG.H
    include/rpc/SVC.H
    include/rpc/SVC_AUTH.H
    include/rpc/TYPES.H
    include/rpc/XDR.H
  PRIVATE
    oncrpc.cpp
    src/auth_non.c
    src/auth_uni.c
    src/authunix.c
    src/bcopy.c
    src/bindresv.c
    src/clnt_gen.c
    src/clnt_per.c
    src/clnt_raw.c
    src/clnt_sim.c
    src/clnt_tcp.c
    src/clnt_udp.c
    src/get_myad.c
    src/getrpcen.c
    src/getrpcpo.c
    src/nt.c
    src/pmap_cln.c
    src/pmap_get.c
    src/pmap_gma.c
    src/pmap_pr.c
    src/pmap_pro.c
    src/pmap_rmt.c
    src/portmap.c
    src/rpc_call.c
    src/rpc_comm.c
    src/rpc_prot.c
    src/svc.c
    src/svc_auth.c
    src/svc_autu.c
    src/svc_raw.c
    src/svc_run.c
    src/svc_simp.c
    src/svc_tcp.c
    src/svc_udp.c
    src/xdr.c
    src/xdr_arra.c
    src/xdr_floa.c
    src/xdr_mem.c
    src/xdr_rec.c
    src/xdr_refe.c
    src/xdr_stdi.c
)