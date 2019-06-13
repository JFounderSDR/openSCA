/***************************************************************************//**
* @file     DASParser.cpp
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

#include "../include/DASParser.h"
#include "../include/debug.h"

DASParser::~DASParser() {

}

DASParser::DASParser(
    CF::File_ptr dasFile):
	m_numElements(0) {
	DEBUG(4, DASParser, "In constructor.")

	m_dasVar = new CF::DeviceAssignmentSequence;

	unsigned long fileSize = dasFile->sizeOf();
	CF::OctetSequence_var fileData;

	dasFile->read(fileData, fileSize);
	dasFile->close();

	unsigned char * fileBuffer = fileData->get_buffer();

	XMLDoc.Parse((const char * )fileBuffer);
	root = XMLDoc.FirstChild("deploymentenforcement");
	if (!root) {
		std::cerr << "ERROR: Not a deployment enforcement file" << std::endl;
		return;
	}

	TiXmlHandle docHandle(root);

	// Handle device assignement sequence file
	TiXmlElement * elem =
	    docHandle.FirstChild("deviceassignmentsequence").FirstChild(
	    	"deviceassignmenttype").Element();
	if (!root) {
		DEBUG(4, DASParser, "could not find <deviceassignmentsequence> node")
		return;
	}

	DEBUG(4, DASParser, "about to parse deviceassignment types")

	for (; elem; elem = elem->NextSiblingElement()) {
		DEBUG(4, DASParser, "found deviceassignment type, adding element")

		add_element();

		// try to find <componentid> node
		TiXmlElement * cid = elem->FirstChildElement("componentid");
		DEBUG(4, DASParser, "Found componentid " << cid->GetText())
		m_dasVar[m_numElements - 1].componentId = 
							CORBA::string_dup(cid->GetText());

		// try to find <assigndeviceid> node
		TiXmlElement * adid = elem->FirstChildElement("assigndeviceid");
		DEBUG(4, DASParser, "Found assigndeviceid: " << adid->GetText())
		m_dasVar[m_numElements - 1].assignedDeviceId = 
							CORBA::string_dup(adid->GetText());
	}

	DEBUG(4, DASParser, "completed parsing.")
}

void
DASParser::add_element() {
	m_numElements++;

	m_dasVar->length(m_numElements);
}

DASParser::DASParser() {

}
