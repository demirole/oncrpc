/******************************************************************************
* Copyright (C) 1995-2008, by AutoForm Engineering GmbH, Zurich.              *
* All Rights Reserved                                                         *
*                                                                             *
* The source code contained in this file is property of AutoForm Engineering  *
* GmbH, Zurich. Unauthorized use, disclosure, duplication, or distribution    *
* in any form, including but not limited to object, library, and executable,  *
* in whole or in part, is strictly prohibited. This source code is for the    *
* exclusive use of AutoForm staff. It must be held in strictest confidence    *
* to protect it against unauthorized use, disclosure, or dissemination.       *
*                                                                             *
* The above copyright and permission notice must appear in all partial and    *
* complete copies of this file.                                               *
******************************************************************************/

// -------------- Subversion InfoHeader - please don't change -----------------
// $Date$
// $Revision$
// $LastChangedRevision$
// $Author$
// $HeadURL$
// ----------------------------------------------------------------------------

//! \file AFM_PLATFORM.H
//! This file adds some platform definition and definition corrections
//! for newer architectures, especially 64bit windows

#ifndef __AFM_PLATFORM_HEADER__
#define __AFM_PLATFORM_HEADER__

// ************************** documentation ******************************** //

// From the platform SDK, 64 bit programming:
//
// New Data Types
//
// The Platform SDK header files contain new data types. These types are primarily
// for type compatibility with the 32-bit data types. The new types provide exactly
// the same typing as the existing types, while at the same time providing support
// for the 64-bit Windows. For more information, see The New Data Types or the
// Basetsd.h header file.
//
// Predefined Macros
//
// The compiler defines the following macros to identify the platform.
//
// Macro 	   Meaning
// _WIN64 	   A 64-bit platform.
// 	         A 32-bit platform.
//
// _WIN32      This value is also defined by the 64-bit compiler for backward
//             compatibility.
//
// _WIN16 	   A 16-bit platform
//
// The following macros are specific to the architecture.
//
// Macro 	   Meaning
//
// _M_IA64 	   Intel Itanium Processor Family
// _M_IX86 	   x86 platform
// _M_X64 	   x64 platform
//
// Do not use these macros except with architecture-specific code, instead, use
// _WIN64, _WIN32, and _WIN16 whenever possible.

// ********************************* flags ********************************* //

// modification for win64 bit compatibility.
//
// The Microsoft Visual Studio 8 c/c++ complier defines _WIN64 automatically if
// in 64 bit mode. This automatically implies also the definition of _WIN32 for
// backward compatibility.
// To make things work under 64 bit and 32 bit windows all that is left to do
// is therefore:
#ifdef _WIN32
#if !defined(WIN32)
#define WIN32  // define for 64 bit and 32 bit
#endif
#endif

// to be sure
#ifdef _WIN64
#if !defined(WIN64)
#define WIN64  // define for 64 bit
#endif
#endif

// ******************************** vice versa ***************************** //
// also for other compilers:

// Consolidate some known operating system identifiers.
// Most people define WIN32 or WIN64 by hand
#if defined(WIN32) || defined(__WIN32__)
#if !defined(_WIN32)
#define _WIN32
#endif
#endif

#if defined(WIN64) || defined(__WIN64__)
#if !defined(_WIN64)
#define _WIN64
#endif
#endif


#endif /* ifndef __AFM_PLATFORM_HEADER__ */
