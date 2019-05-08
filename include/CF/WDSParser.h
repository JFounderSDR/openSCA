/***************************************************************************//**
* @file     WDSParser.h
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

#if !defined(EA_7E6D79A2_D5BC_4199_9815_0F0E7BDE0E60__INCLUDED_)
#define EA_7E6D79A2_D5BC_4199_9815_0F0E7BDE0E60__INCLUDED_

#include <iostream>
#include <map>
#include <vector>

#include "tinyxml.h"

typedef struct
{
	std::string compId;
	std::string devId;
}DeviceAssignmentType;

class WDSParser {

  public:
	WDSParser(
	    const char * fileName);

	virtual ~WDSParser();

	std::vector<DeviceAssignmentType>
	getCompAssignMaps();

	std::string
	getAppName();

	std::string
	getAppId();

  private:
	void
	parseApplication(
	    TiXmlElement * elem);

	void
	parseDeviceAssignmentSequence(
	    TiXmlElement * elem);

	void
	parseDeviceAssignmentType(
	    TiXmlElement * elem);

	void
	parseFile(
	    const char * fileName);

  private:

	std::vector<DeviceAssignmentType> deviceAssignment;
	std::string appName;
	std::string appId;
};

#endif // !defined(EA_7E6D79A2_D5BC_4199_9815_0F0E7BDE0E60__INCLUDED_)