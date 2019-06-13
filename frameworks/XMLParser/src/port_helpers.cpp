/***************************************************************************//**
* @file     port_helpers.cpp
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

#include "../include/port_helpers.h"
#include "../include/debug.h"

/**
* this class is designed to parse connection element for SCD and SAD.
*/
Connection::Connection(
    TiXmlElement * connection):
	m_findBy(NULL),
	m_usesPort(NULL),
	m_providesPort(NULL),
	m_componentSupportedInterface(NULL),
	m_ifUsesPort(false),
	m_ifProvidesPort(false),
	m_ifComponentSupportedInterface(false),
	m_ifFindBy(false),
	m_ifExternalUseConnect(false),
	m_ifExternalProvideConnect(false) {
	DEBUG(4, Connection, "In constructor.")

	parseElement(connection);
}

Connection::Connection(
    const Connection & conn):
	m_findBy(NULL),
	m_usesPort(NULL),
	m_providesPort(NULL),
	m_componentSupportedInterface(NULL),
	m_ifUsesPort(false),
	m_ifProvidesPort(conn.m_ifProvidesPort),
	m_ifComponentSupportedInterface(conn.m_ifComponentSupportedInterface),
	m_ifFindBy(conn.m_ifFindBy) {
	DEBUG(4, Connection, "In constructor.");

	if (conn.m_usesPort != NULL) {
		this->m_usesPort = new UsesPort (*(conn.m_usesPort));
		this->m_ifUsesPort = true;
	}

	if (conn.m_providesPort != NULL)
		this->m_providesPort = new ProvidesPort (*(conn.m_providesPort));

	if (conn.m_findBy != NULL)
		this->m_findBy = new FindBy (*(conn.m_findBy));

	m_connectionId = conn.m_connectionId;
}

Connection::~Connection() {
	if (m_usesPort) {
		delete m_usesPort;
		m_usesPort = NULL;
	}

	if (m_providesPort) {
		delete m_providesPort;
		m_providesPort = NULL;
	}

	if (m_findBy) {
		delete m_findBy;
		m_findBy = NULL;
	}

	for (int i = 0; i < m_externalUsesPorts.size(); i++) {
		if (m_externalUsesPorts[i]) {
			delete m_externalUsesPorts[i];
			m_externalUsesPorts[i] = NULL;
		}
	}

	for (int i = 0; i < m_externalProvidesPorts.size(); i++) {
		if (m_externalProvidesPorts[i]) {
			delete m_externalProvidesPorts[i];
			m_externalProvidesPorts[i] = NULL;
		}
	}
}

ComponentSupportedInterface *
Connection::getComponentSupportedInterface() const {
	return m_componentSupportedInterface;
}

FindBy *
Connection::getFindBy() const {
	return m_findBy;
}

const char *
Connection::getID() {
	return m_connectionId.c_str();
}

ProvidesPort *
Connection::getProvidesPort() const {
	return m_providesPort;
}

UsesPort *
Connection::getUsesPort() const {
	return m_usesPort;
}

bool
Connection::isComponentSupportedInterface() {
	return m_ifComponentSupportedInterface;
}

bool
Connection::isFindBy() {
	return m_ifFindBy;
}

bool
Connection::isProvidesPort() {
	return m_ifProvidesPort;
}

std::vector<UsesPort* >
Connection::getExternalUsesPorts() {
	return m_externalUsesPorts;
}

std::vector<ProvidesPort*>
Connection::getExternalProvidePorts() {
	return m_externalProvidesPorts;
}

void
Connection::parseElement(TiXmlElement* elem) {
	DEBUG(4, Connection,
	      "In parseElement.")

	if (elem->Attribute("id"))
		m_connectionId = elem->Attribute("id");
	DEBUG(5, Connection, "Processing connectionId " << m_connectionId);

	TiXmlElement * port = elem->FirstChild()->ToElement();

	if (!port)
		throw CF::ApplicationFactory::CreateApplicationError(CF::CFNOTSET,
		      "No ports for connectioninterface.");

	//check if this connection is external. if there are two the same type port,
	//this connection is for external port
	int theSameUseNum = 0;
	int theSameProvideNum = 0;
	for (; port; port = port->NextSiblingElement()) {
		std::string nodeName = port->Value();

		if (strcmp(nodeName.c_str(), "usesport") == 0) {
			theSameUseNum++;
			if (theSameUseNum >= 2) {
				m_ifExternalUseConnect = true;
				break;
			}
		} else if (strcmp(nodeName.c_str(), "providesport") == 0) {
			theSameProvideNum++;
			if (theSameProvideNum >= 2) {
				m_ifExternalProvideConnect = true;
				break;
			}
		}
	} //for()

	TiXmlElement * _port = elem->FirstChild()->ToElement();
	//begin to parse port, divide into three situation
	if (m_ifExternalUseConnect == true) {
		DEBUG(5, Connection::parseElement, "m_ifExternalUseConnect is true")
		for (; _port; _port = _port->NextSiblingElement()) {
			std::string nodeName = _port->Value();

			if (strcmp(nodeName.c_str(), "usesport") == 0) {
				DEBUG(5, Connection, "Found usesport and _port is " << _port);
				m_externalUsesPorts.push_back(new UsesPort(_port));

			} else {
				DEBUG(2, Connection, "find Unknown port type when parse \
					external uses port")
			}
		}

		DEBUG(5, Connection, "externalUsesPort size = " << 
			m_externalUsesPorts.size());
	} else if ( m_ifExternalProvideConnect == true ) {
		DEBUG(5, Connection::parseElement, 
			"m_ifExternalProvideConnect is true")

		for (; _port; _port = _port->NextSiblingElement()) {
			std::string nodeName = _port->Value();

			if (0 == strcmp(nodeName.c_str(), "providesport")) {
				DEBUG(5, Connection, 
					"Found providesport and _port is " << _port);
				m_externalProvidesPorts.push_back(new ProvidesPort(_port));
			} else {
				DEBUG(2, Connection, 
					"find Unknown port type when parse external provide port")
			}
		}
	} else {
		DEBUG(5, connect::parseElement, "parse internal port")

		for (; _port; _port = _port->NextSiblingElement()) {
			std::string nodeName = _port->Value();

			DEBUG(5, connect::parseElement, "_port->Value " << _port->Value())

			if (strcmp(nodeName.c_str(), "usesport") == 0) {
				DEBUG(5, Connection, "Found usesport.");
				m_usesPort = new UsesPort(_port);
				m_ifUsesPort = true;

			} else if (strcmp(nodeName.c_str(), "providesport") == 0) {
				DEBUG(5, Connection, "Found providesport");
				m_providesPort = new ProvidesPort(_port);
				m_ifProvidesPort = true;
			} else {
				DEBUG(2, Connection, 
					"find Unknown port type when parse uses and provide port")
			}
		}
	}

	DEBUG(4, Connection, "Finished processing connection.")
}


/**
* class OPENSCA_PARSER_API FindBy
*/
FindBy::FindBy(
    TiXmlElement * element):
	m_ifFindByNamingService(false),
	m_ifFindByStringifiedObjectRef(false),
	m_ifFindByDomainFinder(false) {
	DEBUG(4, FindBy, "In constructor.")

	parseElement(element);
}

FindBy::FindBy(
    const FindBy & fb):
	m_ifFindByNamingService(false),
	m_ifFindByStringifiedObjectRef(false),
	m_ifFindByDomainFinder(false) {
	m_findByNamingService = fb.m_findByNamingService;
	m_findByStringifiedObjectRef = fb.m_findByStringifiedObjectRef;
	m_findByDomainFinderType = fb.m_findByDomainFinderType;
	m_findByDomainFinderName = fb.m_findByDomainFinderName;

	m_ifFindByNamingService = fb.m_ifFindByNamingService;
	m_ifFindByStringifiedObjectRef = fb.m_ifFindByStringifiedObjectRef;
	m_ifFindByDomainFinder = fb.m_ifFindByDomainFinder;
}

FindBy::~FindBy() {

}

const char *
FindBy::getFindByDomainFinderName() {
	return m_findByDomainFinderName.c_str();
}

const char *
FindBy::getFindByDomainFinderType() {
	return m_findByDomainFinderType.c_str();
}

const char *
FindBy::getFindByNamingServiceName() {
	return m_findByNamingService.c_str();
}

const char *
FindBy::getFindByStringifiedObjectRef() {
	return m_findByStringifiedObjectRef.c_str();
}

bool
FindBy::isFindByDomainFinder() {
	return m_ifFindByDomainFinder;
}

bool
FindBy::isFindByNamingService() {
	return m_ifFindByNamingService;
}

bool
FindBy::isFindByStringifiedObjectRef() {
	return m_ifFindByStringifiedObjectRef;
}

void
FindBy::parseElement(
    TiXmlElement * elem) {
	parseFindByNamingService(elem);
	if (isFindByNamingService())
		return;

	parseFindByStringifiedObjectRef(elem);
	if (isFindByStringifiedObjectRef())
		return;

	parseFindByDomainFinder (elem);
	if (!isFindByDomainFinder ())
		return;

	DEBUG(5, port_helpers, "Did not find method to locate port in FindBy.cpp")
}

void
FindBy::parseFindByDomainFinder(
    TiXmlElement * elem) {
	DEBUG(5, FindBy, "In parseFindByDomainFinder.");

	TiXmlElement *df = elem->FirstChildElement("domainfinder");

	if (df) {
		m_findByDomainFinderType = df->Attribute("type");
		if (df->Attribute("name"))
			m_findByDomainFinderName = df->Attribute("name");
		m_ifFindByDomainFinder = true;
	}
}

void
FindBy::parseFindByNamingService(
    TiXmlElement * elem) {
	DEBUG(5, FindBy, "In parseFindByNamingService.");

	if (!elem) {
		DEBUG(5, FindBy, "parseFindByNamingService  elem  is null")
		return;
	}

	TiXmlElement *ns = elem->FirstChildElement("namingservice");

	if (ns) {
		m_findByNamingService = ns->Attribute("name");
		m_ifFindByNamingService = true;
	}
}


void
FindBy::parseFindByStringifiedObjectRef(
    TiXmlElement * elem) {
	DEBUG(5, FindBy, "In parseFindByStringifiedObjectReference.");

	TiXmlElement *sior = elem->FirstChildElement("stringifiedobjectref");

	if (sior) {
		m_findByStringifiedObjectRef = sior->GetText();
		m_ifFindByStringifiedObjectRef = true;
	}
}

ProvidesPort::ProvidesPort(
    TiXmlElement * element):
	Port(element) {
	DEBUG(5, port_helpers, "[ProvidesPort::ProvidesPort]in constructor")
	parseID(element);
}

ProvidesPort::ProvidesPort(
    const ProvidesPort & pp) {
	this->m_ifComponentInstantiationRef = pp.m_ifComponentInstantiationRef;
	this->m_ifDeviceThatLoadedThisComponentRef =
	    pp.m_ifDeviceThatLoadedThisComponentRef;
	this->m_ifDeviceUsedByThisComponentRef = 
		pp.m_ifDeviceUsedByThisComponentRef;
	this->m_ifFindBy = pp.m_ifFindBy;

	m_identifier = pp.m_identifier;
}

ProvidesPort::~ProvidesPort() {

}

const char *
ProvidesPort::getID() {
	return m_identifier.c_str();
}

void
ProvidesPort::parseID(
    TiXmlElement * elem) {
	TiXmlElement * providesId = elem->FirstChildElement("providesidentifier");
	m_identifier = providesId->GetText();
}

Port::Port(
    TiXmlElement * element):
	m_findBy(NULL),
	m_ifComponentInstantiationRef(false),
	m_ifDeviceThatLoadedThisComponentRef(false),
	m_ifDeviceUsedByThisComponentRef(false),
	m_ifFindBy(false) {
	parsePort(element);
}

Port::Port(
    const Port & port):
	m_findBy(NULL),
	m_ifComponentInstantiationRef(port.m_ifComponentInstantiationRef),
	m_ifDeviceThatLoadedThisComponentRef(
		port.m_ifDeviceThatLoadedThisComponentRef),
	m_ifDeviceUsedByThisComponentRef(port.m_ifDeviceUsedByThisComponentRef),
	m_ifFindBy(port.m_ifFindBy) {

	DEBUG(5, port_helpers, "In Port copy constructor")

	m_componentInstantiationRefId = port.m_componentInstantiationRefId;
	m_deviceThatLoadedThisComponentRefId = 
		port.m_deviceThatLoadedThisComponentRefId;
	m_deviceUsedByThisComponentRefId = 
		port.m_deviceUsedByThisComponentRefId;
	m_deviceUsedByThisComponentRefUsesRefId =
	    port.m_deviceUsedByThisComponentRefUsesRefId;
}

Port::Port() {

}

Port::~Port() {
	if (m_findBy) {
		delete m_findBy;
		m_findBy = NULL;
	}
}

void
Port::parseComponentInstantiationRef(
    TiXmlElement * elem) {
	m_componentInstantiationRefId = elem->Attribute("refid");
	m_ifComponentInstantiationRef = true;
}

void
Port::parseDeviceThatLoadedThisComponentRef(
    TiXmlElement * elem) {
	m_deviceThatLoadedThisComponentRefId = elem->Attribute("refid");
	m_ifDeviceThatLoadedThisComponentRef = true;
}

void
Port::parseDeviceUsedByThisComponentRef(
    TiXmlElement * elem) {
	m_deviceUsedByThisComponentRefId = elem->Attribute("refid");
	m_deviceUsedByThisComponentRefUsesRefId = elem->Attribute("usesrefid");
	m_ifDeviceUsedByThisComponentRef = true;
}

void
Port::parseFindBy(
    TiXmlElement * elem) {
	DEBUG(5, port_helpers, "[Port::parseFindBy]")
	m_findBy = new FindBy(elem);
	m_ifFindBy = true;
}

void
Port::parsePort(
    TiXmlElement * port) {
	DEBUG(5, Port, "In parsePort" << port->Value())

	//TiXmlElement *elem;
	TiXmlElement * node = port->FirstChildElement();

	DEBUG(5, Port, "[Port::parsePort].first child...." << node->Value())

	for (; node; node = node->NextSiblingElement()) {
		DEBUG(5, port_helpers, 
			"[Port::parsePort]...in For loop.." << node->Value())
		if (strcmp(node->Value(), "componentinstantiationref") == 0) {
			parseComponentInstantiationRef (node);

		} else if (strcmp(node->Value(), 
			"devicethatloadedthiscomponentref") == 0) {
			parseDeviceThatLoadedThisComponentRef(node);

		} else if (strcmp(node->Value(), "findby") == 0) {
			DEBUG(5, port_helpers, 
				"[Port::parsePort]..find findby element....")
			parseFindBy(node);

		} else if (strcmp(node->Value(), 
			"deviceusedbythiscomponentref") == 0) {
			parseDeviceUsedByThisComponentRef(node);
		}
	}
}

const char *
Port::getComponentInstantiationRefID() {
	return  m_componentInstantiationRefId.c_str();
}

const char *
Port::getDeviceThatLoadedThisComponentRef() {
	return  m_deviceThatLoadedThisComponentRefId.c_str();
}

const char *
Port::getDeviceUsedByThisComponentRefID() {
	return  m_deviceUsedByThisComponentRefId.c_str();
}

const char *
Port::getDeviceUsedByThisComponentRefUsesRefID() {
	return  m_deviceUsedByThisComponentRefUsesRefId.c_str();
}

FindBy *
Port::getFindBy() const {
	return m_findBy;
}

bool
Port::isComponentInstantiationRef() const {
	return m_ifComponentInstantiationRef;
}

bool
Port::isDeviceThatLoadedThisComponentRef() const {
	return m_ifDeviceThatLoadedThisComponentRef;
}

bool
Port::isDeviceUsedByThisComponentRef() const {
	return m_ifDeviceUsedByThisComponentRef;
}

bool
Port::isFindBy() const {
	return m_ifFindBy;
}

UsesPort::UsesPort(
    TiXmlElement * port):
	Port(port) {
	DEBUG(6, UsesPort, "In constructor.");
	parseID(port);
}

UsesPort::UsesPort(
    const UsesPort & port) {
	this->m_ifComponentInstantiationRef = port.m_ifComponentInstantiationRef;
	this->m_ifDeviceThatLoadedThisComponentRef =
	    port.m_ifDeviceThatLoadedThisComponentRef;
	this->m_ifDeviceUsedByThisComponentRef = 
		port.m_ifDeviceUsedByThisComponentRef;
	this->m_ifFindBy = port.m_ifFindBy;

	m_identifier = port.m_identifier;
}

UsesPort::~UsesPort() {

}

const char *
UsesPort::getID() {
	return m_identifier.c_str();
}

void
UsesPort::parseID(
    TiXmlElement * elem) {
	TiXmlElement *usesId = elem->FirstChildElement("usesidentifier");

	if (usesId) {
		m_identifier = usesId->GetText();
	}

	DEBUG(6, UsesPort, "Found uses port " << m_identifier)
}

ExternalPort::ExternalPort(
    TiXmlElement * elem):
	m_ifUsesIdentifier(false),
	m_ifProvidesIdentifier(false),
	m_ifSupportedIdentifier(false) {
	parseElement(elem);
}

ExternalPort::~ExternalPort() {

}

const char *
ExternalPort::getComponentInstantiationRefId() {
	return m_componentInstantiationRefId.c_str();
}

const char *
ExternalPort::getProvidesIdentifier() {
	return m_providesIdentifier.c_str();
}

const char *
ExternalPort::getSupportedIdentifier() {
	return m_supportedIdentifier.c_str();
}

const char *
ExternalPort::getUsesIdentifier() {
	return m_usesIdentifier.c_str();
}

bool
ExternalPort::isProvidesIdentifier() {
	return m_ifProvidesIdentifier;
}

bool
ExternalPort::isSupportedIdentifier() {
	return m_ifSupportedIdentifier;
}

bool
ExternalPort::isUsesIdentifier() {
	return m_ifUsesIdentifier;
}

void
ExternalPort::parseComponentInstantiationRefId(
    TiXmlElement * elem) {
	TiXmlElement * refId = 
		elem->FirstChildElement("componentinstantiationref");

	if (!refId) {
		DEBUG(5, parseComponentInstantiationRefId, "refId is null")
		return;
	}

	m_componentInstantiationRefId = refId->Attribute("refid");
}

void
ExternalPort::parseElement(
    TiXmlElement * elem) {
	parseUsesIdentifier(elem);

	if (!isUsesIdentifier()) {
		parseProvidesIdentifier(elem);
	}
	if (!isProvidesIdentifier()) {
		parseSupportedIdentifier(elem);
	}

	parseComponentInstantiationRefId(elem);
}

void
ExternalPort::parseProvidesIdentifier(
    TiXmlElement * elem) {
	TiXmlElement * providesId = 
		elem->FirstChildElement("providesidentifier");

	if (!providesId)
		return;

	m_providesIdentifier = providesId->GetText();
	m_ifProvidesIdentifier = true;
}

void
ExternalPort::parseSupportedIdentifier(
    TiXmlElement * elem) {
	TiXmlElement * supportedId = 
		elem->FirstChildElement("supportedidentifier");

	if (!supportedId)
		return;

	m_supportedIdentifier = elem->Value();
	m_ifSupportedIdentifier = true;
}


void
ExternalPort::parseUsesIdentifier(
    TiXmlElement * elem) {
	TiXmlElement * usesId = elem->FirstChildElement("usesidentifier");

	if (!usesId)
		return;

	m_usesIdentifier = usesId->GetText();
	m_ifUsesIdentifier = true;
}
