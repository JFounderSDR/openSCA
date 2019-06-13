/***************************************************************************//**
* @file     test_utils.cpp
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

#include "../include/test_utils.h"

unsigned int scaDebugLevel = 0;

void
setCompDebugLevel(
	unsigned int level)
{
	scaDebugLevel = level;
}

void 
printCORBASystemException(
	const CORBA::SystemException & e)
{
	TESTDEBUG(0, [test_utils::printCORBASystemException],
		"CORBA::SystemException e.completed:" << e.completed())
	TESTDEBUG(0, [test_utils::printCORBASystemException],
		"CORBA::SystemException e.minor:" << e.minor())
	TESTDEBUG(0, [test_utils::printCORBASystemException],
		"CORBA::SystemException e._info:" << e._info())
	TESTDEBUG(0, [test_utils::printCORBASystemException],
		"CORBA::SystemException e._name:" << e._name())
	TESTDEBUG(0, [test_utils::printCORBASystemException],
		"CORBA::SystemException e._rep_id:" << e._rep_id())
}

void
printCORBAException(
	const CORBA::Exception & e)
{
	TESTDEBUG(0, [test_utils::printCORBAException],
		"CORBA::Exception e.id:" << e._rep_id())
	TESTDEBUG(0, [test_utils::printCORBAException],
		"CORBA::Exception e.name:" << e._name())
	TESTDEBUG(0, [test_utils::printCORBAException],
		"CORBA::Exception e.info:" << e._info().c_str())
}















