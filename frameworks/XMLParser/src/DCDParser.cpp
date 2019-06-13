/***************************************************************************//**
* @file     DCDParser.cpp
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
#include "../include/DCDParser.h"

/**
 * class OPENSCA_PARSER_API DCDParser:public ComponentAssemblyParser
 */
DCDParser::DCDParser(
    CF::File_ptr file):
	ComponentAssemblyParser(file) {
	DEBUG(4, DCDParser, "Entering constructor")

	m_domainManagerComponent = NULL;
	TiXmlHandle docHandle(m_root);

	parseDeviceManagerSoftPkg(docHandle);
	DEBUG(7, DCDParser, "parseDeviceManagerSoftPkg finished.")

	parseComponentPlacement(docHandle);
	DEBUG(7, DCDParser, "parseComponentPlacement finished.")

	parseDomainManager(docHandle);
	DEBUG(7, DCDParser, "parseDomainManager finished.")

	parseLocalComponents(docHandle);

	DEBUG(7, DCDParser, "Leaving DCDParser constructor.")
}

DCDParser::DCDParser(
    std::string fileName):
	ComponentAssemblyParser(fileName) {
	DEBUG(4, DCDParser, "Entering constructor")

	m_domainManagerComponent = NULL;

	TiXmlHandle docHandle(m_root);

	parseDeviceManagerSoftPkg(docHandle);
	DEBUG(7, DCDParser, "parseDeviceManagerSoftPkg finished.")

	parseComponentPlacement(docHandle);
	DEBUG(7, DCDParser, "parseComponentPlacement finished.")

	parseDomainManager(docHandle);
	DEBUG(7, DCDParser, "parseDomainManager finished.")

	parseLocalComponents(docHandle);

	DEBUG(7, DCDParser, "Leaving DCDParser constructor.")
}

DCDParser::~DCDParser() {
	for (int i = 0; i < m_compositepartofComponents.size(); i++) {
		if (m_compositepartofComponents[i]) {
			delete m_compositepartofComponents[i];
			m_compositepartofComponents[i] = NULL;
		}
	}

	for (int i = 0; i < m_componentPlacements.size(); i++) {
		if (m_componentPlacements[i]) {
			delete m_componentPlacements[i];
			m_componentPlacements[i] = NULL;
		}
	}

	if (m_domainManagerComponent) {
		delete m_domainManagerComponent;
		m_domainManagerComponent = NULL;
	}
}

std::vector <componentFile>
DCDParser::getComponentFiles() {

	return m_componentFiles;
}

const std::vector <DCDComponentPlacement*> *
DCDParser::getComponentPlacements() {

	return &m_componentPlacements;
}


const char *
DCDParser::getDCDFilename() {

	return m_fileName.c_str();
}


const std::vector <DCDComponentPlacement*> *
DCDParser::getDeployOnComponents() {
	return &m_deployOnComponents;
}

const std::vector<DCDComponentPlacement*> *
DCDParser::getCompositepartofComponents() {
	return &m_compositepartofComponents;
}

const char *
DCDParser::getDeviceManagerSoftPkg() {

	return m_deviceManagerSoftPkg.c_str();
}


DCDComponentPlacement *
DCDParser::getDomainManagerComponent() const {
	return m_domainManagerComponent;
}


const char *
DCDParser::getDomainManagerIOR() {
	return m_domainManagerIOR.c_str();
}

const char *
DCDParser::getDomainManagerName() {
	return m_domainManagerName.c_str();
}

const char *
DCDParser::getFileNameFromRefId(
    const char * refid) {
	for (unsigned int i = 0; i < m_componentFiles.size(); i++) {
		if (strcmp(refid, m_componentFiles[i].id()) == 0)
			return m_componentFiles[i].fileName();
	}
	return NULL;
}

/**
 *@brief parse ComponentPlacement of DCD.xml
 *
 *	there are three kinds of ComponentPlacement, include Compositepartof, Deployondevice, \
 *	general component. Components kind of Compositepartof mybe consiste of some component\
 *	kind of deployondevice
 *@param[in]	docHandle
 *@returnval	NA
 */
void
DCDParser::parseComponentPlacement(
    TiXmlHandle docHandle) {
	DEBUG(4, DCDParser::parseComponentPlacement, "In parseComponentPlacement.");

	TiXmlElement * cp =
	    docHandle.FirstChild("partitioning").FirstChild(
	    	"componentplacement").Element();

	for (; cp; cp = cp->NextSiblingElement()) {
		DEBUG(5, DCDParser, "Found component placement.");

		DCDComponentPlacement * dcdComponent = new DCDComponentPlacement(cp);

		if (dcdComponent->isDomainManager()) {
			m_domainManagerComponent = dcdComponent;
		} else if (dcdComponent->isCompositePartOf()) {
			m_compositepartofComponents.push_back(dcdComponent);
			if (dcdComponent->isDeployOn()) {
				m_deployOnComponents.push_back(dcdComponent);
			}
		} else {
			m_componentPlacements.push_back(dcdComponent);
		}
	}
}

void
DCDParser::parseDeviceManagerSoftPkg(
    TiXmlHandle docHandle) {
	DEBUG(4, DCDParser, "In parseDeviceManagerSoftPkg.");

	TiXmlElement * dmspd = 
		docHandle.FirstChild("devicemanagersoftpkg").Element();

	if (dmspd) {
		TiXmlElement * local = dmspd->FirstChildElement("localfile");
		m_deviceManagerSoftPkg = local->Attribute("name");
		DEBUG(5, DCDParser::parseDeviceManagerSoftPkg, 
			"Found device mananager software package " << 
			m_deviceManagerSoftPkg);
	} else {
		DEBUG(5, DCDParser::parseDeviceManagerSoftPkg, 
			"Device Manager Software Package not found.");
	}
}

void
DCDParser::parseDomainManager(
    TiXmlHandle docHandle) {
	DEBUG(4, DCDParser::parseDomainManager, "In parseDomainManager.");

	TiXmlElement * nms =
	    docHandle.FirstChild("domainmanager").FirstChild(
	    	"namingservice").Element();

	if (nms) {
		m_domainManagerName = nms->Attribute("name");
	} else if (TiXmlElement * sior = docHandle.FirstChild("domainmanager").
			FirstChild("stringifiedobjectref").Element()) {
		m_domainManagerIOR = sior->Value();
	} else {
		std::cerr << "DCDParser::parseDomainManager No \
			Domain Manager reference dound" << std::endl;
	}
}

void
DCDParser::parseLocalComponents(
    TiXmlHandle docHandle) {
	DEBUG(4, DCDParser::parseLocalComponents, "In parseLocalComponents.");

	TiXmlElement * cfile =
	    docHandle.FirstChild("componentfiles").FirstChild(
	    	"componentfile").Element();

	for (; cfile; cfile = cfile->NextSiblingElement()) {
		const char * id = cfile->Attribute("id");

		TiXmlElement * local = cfile->FirstChildElement("localfile");
		const char * name = local->Attribute("name");

		DEBUG(5, DCDParser::parseLocalComponents, 
			"Found component " << id << " with file name " << name);

		m_componentFiles.push_back(componentFile(id, name));
	}
}

/**
 * class OPENSCA_PARSER_API DCDComponentPlacement:public ComponentPlacement
 */
DCDComponentPlacement::DCDComponentPlacement(
    TiXmlElement * elem):
	ComponentPlacement(elem),
	m_ifDeployOn(false),
	m_ifCompositePartOf(false),
	m_ifDomainManager(false) {
	DEBUG(4, DCDComponentPlacement, "In constructor.")

	parseDeployOnDevice(elem);
	parseCompositePartOfDevice(elem);
	parseDPDFileName(elem);
	parseInstantiations(elem);

	DEBUG(4, DCDComponentPlacement, "Leaving constructor.")
}

DCDComponentPlacement::~DCDComponentPlacement() {

}

const char *
DCDComponentPlacement::getCompositePartOfDeviceID() {
	return m_compositePartOfDeviceID.c_str();
}

const char *
DCDComponentPlacement::getDeployOnDeviceID() {
	return m_deployOnDeviceID.c_str();
}

const char *
DCDComponentPlacement::getDMDFile() {
	return m_compositePartOfDeviceID.c_str();
}

std::string
DCDComponentPlacement::getDPDFile() {
	return m_dpdFile.c_str();
}

const char *
DCDComponentPlacement::getFileRefId() {
	return m_fileRefId.c_str();
}

const char *
DCDComponentPlacement::getInstantiationId() {
	return m_instantiationId.c_str();
}

const char *
DCDComponentPlacement::getUsageName() {
	return m_usageName.c_str();
}

bool
DCDComponentPlacement::isCompositePartOf() {
	return m_ifCompositePartOf;
}

bool
DCDComponentPlacement::isDeployOn() {
	return m_ifDeployOn;
}

bool
DCDComponentPlacement::isDomainManager() {
	return m_ifDomainManager;
}

void
DCDComponentPlacement::parseCompositePartOfDevice(
    TiXmlElement * elem) {
	DEBUG(4, DCDComponentPlacement, "In parseCompositePartOfDevice.");

	TiXmlElement * composite = elem->FirstChildElement("compositepartofdevice");
	if (composite) {
		m_ifCompositePartOf = true;
		m_compositePartOfDeviceID = composite->Attribute("refid");
	}
}

void
DCDComponentPlacement::parseDeployOnDevice(
    TiXmlElement * elem) {
	DEBUG(4, DCDComponentPlacement::parseDeployOnDevice, 
		"In parseDeployOnDevice.");

	TiXmlElement * deploy = elem->FirstChildElement("deployondevice");
	if (deploy) {
		m_ifDeployOn = true;
		m_deployOnDeviceID = deploy->Attribute("refid");
	}
}

void
DCDComponentPlacement::parseDPDFileName(
    TiXmlElement * elem) {
	DEBUG(4, DCDComponentPlacement::parseDPDFileName, "In DPDFileName.");

	TiXmlElement * DPD = elem->FirstChildElement("devicepkgfile");
	if (DPD) {
		TiXmlElement * local = DPD->FirstChildElement("localfile");
		m_dpdFile = local->Attribute("name");
	} else {
		DEBUG(4, DCDComponentPlacement::parseDPDFileName,
		    "devicepkgfile tag not found, DPD not referenced");
	}
}

void
DCDComponentPlacement::parseInstantiations(
    TiXmlElement * elem) {
	DEBUG(4, DCDComponentPlacement::parseInstantiations, 
		"In parseInstantiations.");

	TiXmlElement * instance = 
		elem->FirstChildElement("componentinstantiation");
	std::vector <ComponentInstantiation* > instantiations;

	unsigned int cnt = 0;
	for (; instance ;
	        instance = instance->NextSiblingElement("componentinstantiation")) {
		cnt++;
		DEBUG(4, DCDComponentPlacement::parseInstantiations, 
			"cnt is " << cnt)
		DEBUG(4, DCDComponentPlacement::parseInstantiations, 
			"instantce is " << instance)
		instantiations.push_back((ComponentInstantiation* ) new
		                          DCDComponentInstantiation(instance));

		m_instantiationId = instantiations.back()->getID();
		m_usageName = instantiations.back()->getUsageName();
	}

	for (int i = 0; i < instantiations.size(); i++) {
		if (instantiations[i]) {
			delete instantiations[i];
			instantiations[i] = NULL;
		}
	}
}

/**
 * class OPENSCA_PARSER_API DCDComponentInstantiation:public ComponentInstantiation
 */
DCDComponentInstantiation::DCDComponentInstantiation(
    TiXmlElement * elem):
	ComponentInstantiation(elem) {
	DEBUG(4, DCDComponentInstantiation, "In constructor.");
}

DCDComponentInstantiation::~DCDComponentInstantiation() {

}

/**
 * class OPENSCA_PARSER_API DCDInstantiationProperty
 */
DCDInstantiationProperty::DCDInstantiationProperty(
    const char * id,
    const char * val) {
	m_id = id;
	m_value = val;
}

DCDInstantiationProperty::~DCDInstantiationProperty() {

}

const char *
DCDInstantiationProperty::getID() {

	return m_id.c_str();
}

const char *
DCDInstantiationProperty::getValue() {

	return  m_value.c_str();
}

void
DCDInstantiationProperty::setID(
    char * id) {
	m_id = id;
}

void
DCDInstantiationProperty::setValue(
    char * value) {
	m_value = value;
}

/**
 * class OPENSCA_PARSER_API componentFile
 */
componentFile::componentFile() {

}

componentFile::~componentFile() {

}

componentFile::componentFile(
    const char * id,
    const char * fileName) {
	m_fileName = fileName;
	m_id = id;
}

const char *
componentFile::fileName() {
	return m_fileName.c_str();
}

const char *
componentFile::id() {
	return m_id.c_str();
}
