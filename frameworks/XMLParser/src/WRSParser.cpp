/***************************************************************************//**
* @file     WRSParser.cpp
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
#include <iostream>

#include "tinyxml.h"

#include "../include/WRSParser.h"
#include "../include/debug.h"

WRSParser::WRSParser() {

}

WRSParser::~WRSParser() {

}

WRSParser::WRSParser(
    const char * fileName) {
	DEBUG(5, WRSParser::WRSParser, "enter with fileName: " << fileName);
	parseFile( fileName );
}

std::vector<std::string>
WRSParser::getInstallApplications() {
	return  installingApps;
}

std::string
WRSParser::getSchemeId() {
	return  schemeId;
}

std::string
WRSParser::getSchemeName() {
	return  schemeName;
}

std::vector<std::string>
WRSParser::getUninstallApplications() {
	return  uninstallingApps;
}

void
WRSParser::parseAppConfiguration(
    TiXmlElement * elem) {
	TiXmlElement * uninstallAppElem =
	    elem->FirstChildElement("uninstallapplications");
	if ( uninstallAppElem ) {
		for (TiXmlElement * child = uninstallAppElem->FirstChildElement("application");
		        child;
		        child = child->NextSiblingElement()) {
			uninstallingApps.push_back(child->GetText());
		}
	}

	TiXmlElement * installAppElem = elem->FirstChildElement("installapplications");
	if ( installAppElem ) {
		for (TiXmlElement * child = installAppElem->FirstChildElement("application");
		        child;
		        child = child->NextSiblingElement()) {
			installingApps.push_back(child->GetText());
		}
	}
}

void
WRSParser::parseFile(
    const char * fileName) {
	TiXmlDocument doc(fileName);

	// faile to load 'xx.wrs.xml'.
	if (!doc.LoadFile()) {
		DEBUG(5, WRSParser::parseFile,
		      "load file failed with error:" << doc.ErrorDesc());
		return;
	}

	// get dom root of 'xx.wrs.xml', here root should be 'reconfigurationscheme'.
	TiXmlElement * root = doc.RootElement();

	if (!root) {
		DEBUG(5, WRSParser::parseFile, "get root is null");
		return;
	}

	if (strcmp(root->Value(), "reconfigurationscheme") != 0) {
		DEBUG(5, WRSParser::parseFile, "have not parse first element");
		return;
	}

	//parse reconfig scheme id and name
	schemeId = root->Attribute("id");
	schemeName = root->Attribute("name");

	for (TiXmlElement * elem = root->FirstChildElement();
	        elem;
	        elem = elem->NextSiblingElement()) {
		if (strcmp(elem->Value(), "applicationconfiguration") == 0) {
			parseAppConfiguration( elem );
		} else if (strcmp(elem->Value(), "networkconfiguration") == 0) {
			parseNetworkConfiguration( elem );
		}
	}
}

void
WRSParser::parseNetworkConfiguration(
    TiXmlElement * elem) {

}
