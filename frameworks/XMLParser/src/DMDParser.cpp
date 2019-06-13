/***************************************************************************//**
* @file     DMDParser.cpp
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

#include <fstream>
#include <sstream>

#include "../include/debug.h"
#include "../include/DMDParser.h"

/**
 * class OPENSCA_PARSER_API DMDParser
 */
DMDParser::DMDParser(
    CF::File_ptr file) {
	DEBUG(4, DMDParser, "In constructor.")

	unsigned long fileSize = file->sizeOf();
	CF::OctetSequence_var fileData;

	file->read(fileData, fileSize);

	unsigned char * fileBuffer = fileData->get_buffer();

	m_xmlDoc.Parse((const char *)fileBuffer);

	TiXmlElement * elem = m_xmlDoc.FirstChildElement(
		"domainmanagerconfiguration");
	if (!elem) {
		DEBUG(2, DMDParser, "Bad DMD file.")
	}

	parseFile(elem);
	parseDomainManagerSoftPkg (elem);

	DEBUG(4, DMDParser, "leaving constructor...")
}

DMDParser::DMDParser(
    std::string fileName) {
	DEBUG(4, DMDParser, "In constructor.")

	std::ifstream fileIn(fileName.c_str());

	std::stringstream buffer;
	buffer << fileIn.rdbuf();
	std::string contents(buffer.str());

	m_xmlDoc.Parse(contents.c_str());
	TiXmlElement * elem = m_xmlDoc.FirstChildElement(
		"domainmanagerconfiguration");
	if (!elem) {
		DEBUG(2, DMDParser, "Bad DMD file.")
	}

	parseFile(elem);
	parseDomainManagerSoftPkg (elem);

	DEBUG(4, DMDParser, "leaving constructor...")
}

DMDParser::~DMDParser() {

}

const char * 
DMDParser::getID() {

	return m_dmdId.c_str();
}

const char *
DMDParser::getName() {

	return m_dmdName.c_str();
}

const char *
DMDParser::getDomainManagerSoftPkg() {

	return m_domainManagerSoftPkg.c_str();
}

void
DMDParser::parseDomainManagerSoftPkg(
    TiXmlElement * elem) {
	DEBUG(4, DMDParser, "In parseDomainManagerSoftPkg.")

	TiXmlElement * dmSoft = elem->FirstChildElement("domainmanagersoftpkg");

	if (dmSoft) {
		TiXmlElement * local = dmSoft->FirstChildElement("localfile");
		m_domainManagerSoftPkg = local->Attribute("name");
		DEBUG(8, DMDParser, "Found DM soft pkg " << m_domainManagerSoftPkg);
	}

	DEBUG(4, DMDParser, "leaving parseDomainManagerSoftPkg...")
}

void
DMDParser::parseFile(
    TiXmlElement * elem) {
	DEBUG(4, DMDParser, "In parseFile.");

	m_dmdId = elem->Attribute("id");
	m_dmdName = elem->Attribute("name");
}

const char *
DMDParser::toString() {
	return  NULL;
}
