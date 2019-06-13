/***************************************************************************//**
* @file     SCDParser.cpp
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
#include "../include/SCDParser.h"

SCDParser::SCDParser() {

}

/**
 * No default Constructor
 */
SCDParser::SCDParser(
    SCDParser & scd) {

}

SCDParser::SCDParser(
    CF::File_ptr file) {
	DEBUG(4, SCDParser, "In constructor.");

	unsigned long fileSize = file->sizeOf();
	CF::OctetSequence_var fileData;

	file->read(fileData, fileSize);
	unsigned char * fileBuffer = fileData->get_buffer();
	m_xmlDoc.Parse((const char *)fileBuffer);

	TiXmlElement * elem = m_xmlDoc.FirstChildElement("softwarecomponent");
	if (!elem) {
		DEBUG(1, SCDParser, "Bad SCD file.");
	}

	parseFile(elem);
}

SCDParser::~SCDParser() {

}

const char *
SCDParser::getComponentType() {
	return m_componentType.c_str();
}

const char *
SCDParser::getPRFFile() {
	return m_prfFile.c_str();
}

bool
SCDParser::isApplication() {
	if (strcmp(m_componentType.c_str(), "application") == 0) {
		return true;
	} else {
		return false;
	}
}

bool
SCDParser::isConfigurable() {
	if (strcmp(m_componentType.c_str(), "resource") == 0 ||
	        strcmp(m_componentType.c_str(), "application") == 0 ||
	        strcmp(m_componentType.c_str(), "devicemanager") == 0 ||
	        (isDevice ()) || (isDomainManager ())) {
		return true;
	} else {
		return false;
	}
}

bool
SCDParser::isDevice() {
	if (strcmp(m_componentType.c_str(), "device") == 0)
		return true;
	else
		return false;
}

bool
SCDParser::isDeviceManager() {
	if (strcmp(m_componentType.c_str(), "devicemanager") == 0)
		return true;
	else
		return false;
}

bool
SCDParser::isDomainManager() {
	if (strcmp(m_componentType.c_str(), "domainmanager") == 0)
		return true;
	else
		return false;
}

bool
SCDParser::isResource() {
	if (strcmp(m_componentType.c_str(), "resource") == 0) {
		return true;
	} else {
		return false;
	}
}

bool
SCDParser::isService() {
	if (strcmp(m_componentType.c_str(), "logger") == 0 ||
	        strcmp(m_componentType.c_str(), "filemanager") == 0 ||
	        strcmp(m_componentType.c_str(), "filesystem") == 0) {
		return true;
	} else {
		return false;
	}
}

void
SCDParser::parseComponentType(
    TiXmlElement * elem) {
	TiXmlElement * type = elem->FirstChildElement("componenttype");

	if (type) {
		m_componentType = type->GetText();;
	}
}

void
SCDParser::parseFile(
    TiXmlElement * elem) {
	DEBUG(4, SCDParser, "In parseFile.");

	parseComponentType(elem);
	parsePRFRef(elem);
}

void
SCDParser::parsePRFRef(
    TiXmlElement * elem) {
	TiXmlElement * prf = elem->FirstChildElement("propertyfile");

	if (prf) {
		TiXmlElement * local = elem->FirstChildElement("localfile");

		if (local)
			m_prfFile = local->Attribute("name");
	}
}
