/***************************************************************************//**
* @file     test_utils.h
* @author   open Team
* @version  9
* @date     2019-05-22
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
#ifndef _TEST_UTILS_H
#define _TEST_UTILS_H

#include <iostream>
#include <sys/types.h>
#include <unistd.h>
#include <errno.h>

#include "orbsvcs/orbsvcs/CosNamingC.h"
#include "tao/PortableServer/PortableServer.h"

extern unsigned int scaDebugLevel;
extern void setCompDebugLevel(unsigned int level);

#define TESTDEBUG(level, title, debuginfo) \
	if(level <= scaDebugLevel)\
		std::cout << "PID:" << getpid() << "  " << #title << ":" << debuginfo << std::endl;

void 
printCORBASystemException(
	const CORBA::SystemException & e);

void
printCORBAException(
	const CORBA::Exception & e);



#endif	//_TEST_UTILS_H








