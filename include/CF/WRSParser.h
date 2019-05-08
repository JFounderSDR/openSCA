/***************************************************************************//**
* @file     WRSParser.h
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

#if !defined(EA_44CB6B2D_007D_4a95_9F25_F36A5AB96660__INCLUDED_)
#define EA_44CB6B2D_007D_4a95_9F25_F36A5AB96660__INCLUDED_

#include <iostream>
#include <vector>

#include "tinyxml.h"

class WRSParser {

  public:
	WRSParser();
	virtual ~WRSParser();

	WRSParser(
	    const char * fileName);

	std::vector<std::string>
	getInstallApplications();

	std::string
	getSchemeId();

	std::string
	getSchemeName();

	std::vector<std::string>
	getUninstallApplications();

  private:
	std::vector<std::string> installingApps;
	std::vector<std::string> uninstallingApps;
	std::string schemeId;
	std::string schemeName;

	void
	parseAppConfiguration(
	    TiXmlElement * elem);

	void
	parseFile(
	    const char * fileName);

	void
	parseNetworkConfiguration(
	    TiXmlElement * elem);

};

#endif // !defined(EA_44CB6B2D_007D_4a95_9F25_F36A5AB96660__INCLUDED_)