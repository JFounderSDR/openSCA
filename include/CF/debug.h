/***************************************************************************//**
* @file     debug.h
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

#ifndef _DEBUG_H
#define _DEBUG_H

/**
 * 	level ~= 0, when openscaDebugLevel=0, nothing debug info print
 * 	level = 1: key step, such as launch domain/devicemanager/namingService/logservice, create app, unload app
 * 	level = 2: secondary key step, such as launch devices, and exception in runtime
 * 	level = 3: the interface defined in SCA
 * 	level = 4: the user-defined interface, be used to test
 * 	level = 5: undefined
 */

#include <sys/types.h>
#include <unistd.h>
#include <errno.h>

#include <iostream>
#include "Boost_utils.h"

#define DEBUG_LEVEL_ID    ("debugLevelId")

#if 0
#define QT_NO_DEBUG_OUTPUT      //shield debug output
#define QT_NO_WARNING_OUTPUT    //shield warning output
#endif

void 
set_debug_level(
	int level);

#define  FUN_DEBUG_EN        0
#define  FUN_WARNING_EN      0

#define DEBUG(level, title, debuginfo) \
	if(level <= getDebugLevel(DEBUG_LEVEL_ID))\
		std::cout << "PID:" << getpid() << "  " << #title << ":" << debuginfo << std::endl;

#define DEBUG_V2(level, title, debuginfo) \
	if(level <= openscaDebugLevelV2)\
		std::cout << #title << ":" << debuginfo << std::endl;

#if FUN_DEBUG_EN
#define FUN_ENTER_DEBUG()       qDebug()<<"["<<__FUNCTION__<<__LINE__<<"]" <<
									"entering..."

#define FUN_LEAVE_DEBUG()       qDebug()<<"["<<__FUNCTION__<<__LINE__<<"]" <<
									"leave..."

#define FUN_APPEND_DEBUG()      qDebug()<<"["<<__FUNCTION__<<__LINE__<<"]"
#else
#define FUN_ENTER_DEBUG()       std::cout<<"["<<__FUNCTION__<<__LINE__<<"]" <<"entering..."<< std::endl;

#define FUN_LEAVE_DEBUG()       std::cout<<"["<<__FUNCTION__<<__LINE__<<"]" <<"leave..."<< std::endl;

#define FUN_APPEND_DEBUG()      std::cout<<"["<<__FUNCTION__<<__LINE__<<"]"
#endif

#if FUN_WARNING_EN
#define FUN_ENTER_WARNING()     qWarning()<<"["<<__FUNCTION__<<__LINE__<<"]" <<
									"entering..."

#define FUN_LEAVE_WARNING()     qWarning()<<"["<<__FUNCTION__<<__LINE__<<"]" <<
									"leave..."

#define FUN_APPEND_WARNING()    qWarning()<<"["<<__FUNCTION__<<__LINE__<<"]"
#else
#define FUN_ENTER_WARNING()     std::cout<<"["<<__FUNCTION__<<__LINE__<<"]" <<"entering..."<<std::endl;

#define FUN_LEAVE_WARNING()     std::cout<<"["<<__FUNCTION__<<__LINE__<<"]" <<"leave..."<<std::endl;
									
#define FUN_APPEND_WARNING()    std::cout<<"["<<__FUNCTION__<<__LINE__<<"]"
#endif

#endif	//OPENSCA_DEBUG_H
