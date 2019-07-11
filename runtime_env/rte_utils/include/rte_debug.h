/***************************************************************************//**
* @file     rte_debug.h
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

#ifndef RTE_DEBUG_H
#define RTE_DEBUG_H

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
#include <boost/interprocess/managed_shared_memory.hpp>

#define  RTE_DEBUG_LEVEL_ID	 ("rteDebugLevelId")
#define  SCA_SHM         ("sca_shm")

/**
 * configure debug level.
 * 
 * @param[in] debugId  debug type
 * @param[in] level    debug level
 */
void
setDebugLevel(
	std::string debugId,
    int level);

/**
 * configure debug level.
 * 
 * @return  debug level
 */
int
getDebugLevel(
	std::string debugId);

void 
set_rte_debug_level(
	int level);

#define RTE_DEBUG(level, title, debuginfo) \
	if(level <= getDebugLevel(RTE_DEBUG_LEVEL_ID))\
		std::cout << "PID:" << getpid() << "  " << #title << ":" << debuginfo << std::endl;

#endif	//OPENSCA_DEBUG_H
