/***************************************************************************//**
* @file     UsesConnectionInfo.h
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
#ifndef __USESCONNECTIONINFO_H
#define __USESCONNECTIONINFO_H

#include "CFS.h"

class UsesConnectionInfo
{

public:
	virtual ~UsesConnectionInfo();

	UsesConnectionInfo(
		CF::PPort_ptr port,
		const char * id);

	const char *
	getID();

	CF::PPort_ptr
	getPort();

private:
	std::string m_identifier;
	CF::PPort_var m_portObj;

	UsesConnectionInfo(); //No default constructor
};

#endif /* __USESCONNECTIONINFO_H */