/***************************************************************************//**
* @file     macros.h
* @author   open Team
* @version  9
* @date     2017-03-16
* @brief
* @Remark : <Description>
* @verbatim
* ==============================================================================
* <Date>     | <Version> | <Author>       | <Description>
* ==============================================================================
*  2015-05-23 | 1       | open Team       | Create file
* ==============================================================================
* @endverbatim
* ******************************************************************************
* <h2><center>&copy; Copyright(c)2015-2025 JFounder Info Tech Co.,Ltd</center></h2>
* All rights reserved. The right to copy, distribute, modify or otherwise make use
* of this software may be licensed only pursuant to the terms of an applicable
* JFounder license agreement. Company website: www.onetek.net
*//****************************************************************************/

#ifndef	__MACROS_H__
#define	__MACROS_H__

#ifdef __VXWORKS__
/** indicate that use specialized vxworks api */
#define __SDS_OS_VXWORKS__
#elif defined __linux__
/** indicate that use specialized linux api*/
#define __SDS_OS_LINUX__
#endif
/** indicate that use boost library*/
#define	__USE_BOOST_LIB__

#endif	//__LIBCF_MACROS_H__