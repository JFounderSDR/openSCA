/***************************************************************************//**
* @file     SADParser.cpp
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
#include <string.h>

#include "../include/SADParser.h"
#include "../include/SPDParser.h"
#include "../include/debug.h"
#include "ConfigParser.h"
#include "utils.h"

/**
 * class OPENSCA_PARSER_API SADParser:public ComponentAssemblyParser
 */
SADParser::SADParser(
    CF::File_ptr file):
	ComponentAssemblyParser(file),
	m_assemblyControllerInstantiation(NULL) {
	DEBUG(6, SADParser, "In SADParser constructor.")
	TiXmlHandle docHandle(m_root);
	parseFile(docHandle);
}

SADParser::~SADParser() {
	DEBUG(6, SADParser, "Entering destructor")

	unsigned int i;

	DEBUG(9, SADParser::~SADParser, "Deleting m_hostCollocations")
	for (i = 0; i < m_hostCollocations.size(); i++) {
		if (m_hostCollocations[i]) {
			delete m_hostCollocations[i];
			m_hostCollocations[i] = NULL;
		}
	}

	DEBUG(9, SADParser::~SADParser, "Deleting m_externalPorts")
	for (i = 0; i < m_externalPorts.size(); i++) {
		if (m_externalPorts[i]) {
			delete m_externalPorts[i];
			m_externalPorts[i] = NULL;
		}
	}

	//NOTE: this section fails for some reason
	DEBUG(9, SADParser::~SADParser, "Deleting components");
	for (i = 0; i < m_components.size(); i++) {
		if (m_components[i]) {
			delete m_components[i];
			m_components[i] = NULL;
		}
	}

	for (i = 0; i < m_componentFiles.size(); i++) {
		if (m_componentFiles[i]) {
			delete m_componentFiles[i];
			m_componentFiles[i] = NULL;
		}
	}

	if (m_assemblyControllerInstantiation) {
		delete m_assemblyControllerInstantiation;
		m_assemblyControllerInstantiation = NULL;
	}

	DEBUG(6, SADParser::~SADParser, "Leaving destructor");
}

SADComponentInstantiation *
SADParser::getAssemblyController() {
	return m_assemblyControllerInstantiation;
}

const char *
SADParser::getAssemblyControllerRefId() {
	return m_assemblyControllerRefId.c_str();
}

std::vector <SADComponentPlacement* > *
SADParser::getComponents() {
	return &m_components;
}

std::vector <SADComponentPlacement* > *
SADParser::getCorbaComponents() {
	return &m_corbaComps;
}

std::vector <SADComponentPlacement* > *
SADParser::getNonCorbaComponents() {
	return &m_nonCorbaComps;
}

std::vector <ExternalPort* > *
SADParser::getExternalPorts() {
	return &m_externalPorts;
}

std::vector <SADHostCollocation* > *
SADParser::getHostCollocations() {
	return &m_hostCollocations;
}

const char *
SADParser::getSADFilename() {
	return m_fileName.c_str();
}

const char *
SADParser::getSPDById(
    const char * _refid) {
	std::string refId(_refid);

	for (unsigned int i(0); i < m_componentFiles.size(); ++i) {
		std::string testId = m_componentFiles[i]->getId();

		if (refId == testId)
			return m_componentFiles[i]->getFileName();
	}

	return NULL;
}

void
SADParser::parseAssemblyController(
    TiXmlHandle docHandle) {
	DEBUG(4, SADParser::parseAssemblyController, "In parseAssemblyController.")

	TiXmlElement * ac =
	    docHandle.FirstChild("assemblycontroller").FirstChild(
	    	"componentinstantiationref").Element();

	if (ac) {
		m_assemblyControllerRefId = ac->Attribute("refid");
		DEBUG(7, SADParser::parseAssemblyController, 
			"Assembly controller refid = " << m_assemblyControllerRefId);
	} else {
		DEBUG(1, SADParser::parseAssemblyController, 
			"Assembly Controller Ref ID not found.")
	}
}

void
SADParser::parseComponentFiles(
    TiXmlHandle docHandle) {
	DEBUG(6, SADParser::parseComponentFiles, "About to parse component files")

	TiXmlElement * cf =
	    docHandle.FirstChild("componentfiles").FirstChild(
	    	"componentfile").Element();

	for (; cf; cf = cf->NextSiblingElement()) {
		m_componentFiles.push_back (new SADComponentFile (cf));
	}
}

void
SADParser::parseComponents(
    TiXmlHandle docHandle) {
	DEBUG(6, SADParser::parseComponents, "About to parse components.");

	TiXmlElement * cp =
	    docHandle.FirstChild("partitioning").FirstChild(
	    	"componentplacement").Element();

	if (!cp)
		DEBUG(4, SADParser::parseComponents, "No component placements found" )

		for (; cp; cp = cp->NextSiblingElement()) {
			DEBUG(7, SADParser::parseComponents, 
				"Found component, about to create placement " <<
			    cp->Value() << " node type " << cp->Type() )

			m_components.push_back (new SADComponentPlacement (cp));
		}

    char openScaPath[64];
    getConfigFilePathFromSHM(openScaPath, sizeof(openScaPath));
  	ConfigParser configParser(openScaPath);
	std::string fsRoot = configParser.getValueById(CONSTANT::FSROOT);
	std::string sdrRoot = configParser.getValueById(CONSTANT::SDRROOT);

	for (int i = 0; i < m_components.size(); i++) {
		for (int j = 0; j < m_componentFiles.size(); j++) {
			if ( 0 != strcmp(m_components[i]->getFileRefId(),
			                 m_componentFiles[j]->getId()) )
				continue;

			std::string spdFilePath = fsRoot + "/" + sdrRoot + "/"
				                          + m_componentFiles[j]->getFileName();
			SPDParser spdParser(spdFilePath);
			if (spdParser.isScaCompliant()) {
				m_components[i]->setScaCompliant(true);
				m_corbaComps.push_back(m_components[i]);
			} else {
				m_components[i]->setScaCompliant(false);
				m_nonCorbaComps.push_back(m_components[i]);
			}
		}
	}
}

void
SADParser::parseExternalPorts(
    TiXmlHandle docHandle) {
	DEBUG(4, SADParser::parseExternalPorts, "In parseExternalPorts.");

	TiXmlElement * ep = docHandle.FirstChild("externalports").Element();

	if (ep) {
		TiXmlElement * port = ep->FirstChildElement("port");

		for (; port; port = port->NextSiblingElement()) {
			m_externalPorts.push_back(new ExternalPort (port));
		}
	}
}

void
SADParser::parseFile(
    TiXmlHandle docHandle) {
	parseComponentFiles(docHandle);
	parseComponents(docHandle);
	parseHostCollocation(docHandle);
	parseAssemblyController(docHandle);
	parseExternalPorts(docHandle);
}

void
SADParser::parseHostCollocation(
    TiXmlHandle docHandle) {
	DEBUG(4, SADParser::parseHostCollocation, "Parsing Host Collocation")
	TiXmlElement * col =
	    docHandle.FirstChild("partitioning").FirstChild(
	    	"hostcollocation").Element();

	if (col) {
		const char * id = col->Attribute("id");
		const char * name = col->Attribute("name");

		std::vector <SADComponentPlacement* > collocatedComponents;
		TiXmlElement * place = col->FirstChildElement("componentplacement");
		for (; place; place = place->NextSiblingElement()) {
			DEBUG(6, SADParser, "Found placement.");
			collocatedComponents.push_back(new SADComponentPlacement (place));
		}

		DEBUG(6, SADParser, "Done parsing placements.");

		m_hostCollocations.push_back(new SADHostCollocation (
			id, name, collocatedComponents));
	}
}

/**
 * class OPENSCA_PARSER_API SADComponentPlacement:public ComponentPlacement
 */
SADComponentPlacement::SADComponentPlacement(
    TiXmlElement * elem):
	ComponentPlacement(elem) {
	DEBUG(4, SADParser::SADComponentPlacement, 
		"In SADComponentPlacement constructor.")

	m_scaCompliant = true;
	parseElement(elem);

	for (unsigned int i = 0; i < m_instantiations.size(); i++)
		sadComp.push_back((SADComponentInstantiation * ) m_instantiations[i]);

	ComponentPlacement::parseElement(elem);
}

SADComponentPlacement::~SADComponentPlacement() {

}

SADComponentInstantiation *
SADComponentPlacement::getSADInstantiationById(
    char * _id) const {
	for (unsigned int i = 0; i < m_instantiations.size(); i++) {
		if (strcmp(m_instantiations[i]->getID(), _id) == 0)
			return (SADComponentInstantiation* ) m_instantiations[i];
	}

	return NULL;
}

std::vector <SADComponentInstantiation*> *
SADComponentPlacement::getSADInstantiations() {
	DEBUG(4, SADComponentPlacement::getSADInstantiations, 
		"In getSADInstantiations.")
	return &sadComp;
}

bool
SADComponentPlacement::setScaCompliant(
    bool scaCompliant) {
	this->m_scaCompliant = scaCompliant;
}

bool
SADComponentPlacement::isScaCompliant() {
	return m_scaCompliant;
}

void
SADComponentPlacement::parseElement(
    TiXmlElement * elem) {
	parseFileRef(elem);
	parseInstantiations(elem);
}

void
SADComponentPlacement::parseInstantiations(
    TiXmlElement * elem) {
	DEBUG(4, SADComponentPlacement::parseInstantiations, 
		"In parseInstantiations.")

	TiXmlElement * instance = 
		elem->FirstChildElement("componentinstantiation");
	for (; instance; instance = instance->NextSiblingElement()) {
		DEBUG(5, SADComponentPlacement::parseInstantiations, 
			"Found componentinstantiation.");

		SADComponentInstantiation* SADInstance = 
			new SADComponentInstantiation(instance);
		m_instantiations.push_back((ComponentInstantiation*)SADInstance);
	}
}

/**
 * class OPENSCA_PARSER_API SADComponentInstantiation:public ComponentInstantiation
 */
SADComponentInstantiation::SADComponentInstantiation(
    TiXmlElement * elem):
	ComponentInstantiation(elem),
	m_ifResourceFactoryRef(false), m_ifNamingService(false) {
	parseElement();
}

SADComponentInstantiation::~SADComponentInstantiation() {
	for (unsigned int i = 0; i < m_factoryProperties.size(); i++) {
		delete m_factoryProperties[i];
	}
}

std::vector <InstantiationProperty*> *
SADComponentInstantiation::getFactoryProperties() {
	return &m_factoryProperties;
}

const char *
SADComponentInstantiation::getFindByNamingServiceName() {
	DEBUG(4, SADComponentInstantiation::getFindByNamingServiceName, 
		"getFindByNamingServiceName returning: " << m_findByNamingServiceName);
	return m_findByNamingServiceName.c_str();
}

const char *
SADComponentInstantiation::getResourceFactoryRefId() {
	return m_resourceFactoryRefId.c_str();
}

bool
SADComponentInstantiation::isNamingService() {
	return m_ifNamingService;
}

bool
SADComponentInstantiation::isResourceFactoryRef() {
	return m_ifResourceFactoryRef;
}

void
SADComponentInstantiation::parseElement() {
	ComponentInstantiation::parseElement();
	parseFindComponent(m_root);
}

void
SADComponentInstantiation::parseFindComponent(
    TiXmlElement * _elem) {
	DEBUG(4, SADComponentInstantiation::parseFindComponent, 
		"In parseFindComponent")

	TiXmlElement * findcomponent = _elem->FirstChildElement("findcomponent");
	if (findcomponent) {
		TiXmlElement * tag = findcomponent->FirstChildElement("namingservice");

		if (tag) {
			m_findByNamingServiceName = tag->Attribute("name");
			m_ifNamingService = true;
			DEBUG(9, SADComponentInstantiation::parseFindComponent, 
				"Found naming service name: " << m_findByNamingServiceName);
		}
	}
}

/**
 * class OPENSCA_PARSER_API SADHostCollocation
 */
SADHostCollocation::SADHostCollocation(
    const char * _id,
    const char * _name,
    std::vector <SADComponentPlacement*> _collocatedComponents) {
	if (_id)
		m_id = _id;

	if (_name)
		m_name = _name;

	std::vector <SADComponentPlacement*>::iterator beg =
	    _collocatedComponents.begin ();

	std::vector <SADComponentPlacement*>::iterator end =
	    _collocatedComponents.end ();

	m_collocatedComponents.assign(beg, end);
}

SADHostCollocation::~SADHostCollocation() {

}

std::vector <SADComponentPlacement*>
SADHostCollocation::getComponents() const {
	return m_collocatedComponents;
}

const char *
SADHostCollocation::getID() {
	return m_id.c_str();
}

const char *
SADHostCollocation::getName() {
	return m_name.c_str();
}

SADComponentFile::SADComponentFile(
    TiXmlElement * elem) {
	DEBUG(6, SADComponentFile, "In SADComponentFile constructor.")

	parseElement(elem);
}

SADComponentFile::~SADComponentFile() {
}

void
SADComponentFile::parseElement(
    TiXmlElement * elem) {
	m_type = elem->Attribute("type");
	m_id = elem->Attribute("id");

	TiXmlElement * local = elem->FirstChildElement("localfile");
	m_fileName = local->Attribute("name");

	DEBUG(5, SADComponentFile,
	    "Found type: " << m_type << ", id: " << m_id << 
	    ", fileName: " << m_fileName)
}
