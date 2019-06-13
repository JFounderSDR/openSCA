/***************************************************************************//**
* @file     UsesConnectionInfo.cpp
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

#include "../include/debug.h"
#include "../include/UsesConnectionInfo.h"

UsesConnectionInfo::UsesConnectionInfo(
	CF::PPort_ptr port,
	const char * id)
{
	if (!CORBA::is_nil(port))
	{
		m_portObj = CF::PPort::_duplicate(port);
	} else {
		DEBUG(1, UsesConnectionInfo::UsesConnectionInfo,
			"input port is nil")
	}

	if (id)
	{
		m_identifier = id;
	} else {
		DEBUG(1, UsesConnectionInfo::UsesConnectionInfo,
			"input id is nil")
	}
}

//No default constructor
UsesConnectionInfo::UsesConnectionInfo() 
{ 

}

UsesConnectionInfo::~UsesConnectionInfo() 
{

}

const char *
UsesConnectionInfo::getID() 
{
	return  m_identifier.c_str();
}

CF::PPort_ptr
UsesConnectionInfo::getPort() 
{
	return  m_portObj._retn();
}
