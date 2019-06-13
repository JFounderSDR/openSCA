/***************************************************************************//**
* @file     WDSParser.cpp
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
#include "tinyxml.h"

#include "../include/WDSParser.h"
#include "../include/debug.h"

WDSParser::WDSParser(
    const char * fileName) {
	DEBUG(5, WDSParser::WDSParser, "enter with fileName: " << fileName)
	parseFile( fileName );
}

WDSParser::~WDSParser() {

}

std::vector<DeviceAssignmentType>
WDSParser::getCompAssignMaps() {
	return  deviceAssignment;
}

void
WDSParser::parseApplication(
    TiXmlElement * elem) {
	if (elem == NULL) {
		std::cerr << "[WDSParser::parseDeviceAssignmentSequence]elem is null" << std::endl;
		return;
	}

	appName = elem->Attribute("name");
	appId = elem->Attribute("id");
}

void
WDSParser::parseDeviceAssignmentSequence(
    TiXmlElement * elem) {
	if (elem == NULL) {
		std::cerr << "[WDSParser::parseDeviceAssignmentSequence]elem is null" << std::endl;
		return;
	}

	for (TiXmlElement* el = elem->FirstChildElement("deviceassignmenttype");
	        el;
	        el = el->NextSiblingElement()) {
		parseDeviceAssignmentType( el );
	}

}

void
WDSParser::parseDeviceAssignmentType(
    TiXmlElement * elem) {
	std::string compId = elem->FirstChildElement("componentid")->GetText();
	std::string devId = elem->FirstChildElement("assigndeviceid")->GetText();

	DeviceAssignmentType devAssign;
	devAssign.compId = compId;
	devAssign.devId = devId;
	deviceAssignment.push_back(devAssign);
}

void
WDSParser::parseFile(
    const char * fileName) {
	DEBUG(5, WDSParser::parseFile, "filename is: " << fileName);

	TiXmlDocument doc(fileName);

	bool loadOkay = doc.LoadFile();
	// faile to load 'xx.wds.xml'.
	if (!loadOkay) {
		DEBUG(5, WDSParser::parseFile,
		      "load file failed with error: " << doc.ErrorDesc());
		return;
	}

	// get dom root of 'xx.wds.xml', here root should be 'deploymentenforcement'.
	TiXmlElement * root = doc.RootElement();

	if (!root) {
		DEBUG(5, WDSParser::parseFile, "get root is null");
		return;
	}

	if (strcmp(root->Value(), "deploymentenforcement") != 0) {
		DEBUG(5, WDSParser::parseFile, "have not parse first element");
		return;
	}

	TiXmlElement * devAssignSeq =
	    root->FirstChildElement("deviceassignmentsequence");
	if (devAssignSeq)
		parseDeviceAssignmentSequence(devAssignSeq);

	TiXmlElement * appElem = root->FirstChildElement("application");
	if (appElem)
		parseApplication( appElem );
}
