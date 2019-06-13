/***************************************************************************//**
* @file     parser_helpers.cpp
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

#include "../include/parser_helpers.h"
#include "../include/debug.h"

/**
 * this class is designed to parse assembly component consisted of SAD and SCD. it
 * provide parseConnections and parseIdandName operations.
 */
ComponentAssemblyParser::ComponentAssemblyParser(
    CF::File_ptr file) {
	DEBUG(6, ComponentAssemblyParser,
	    "Entering constructor with" << file->fileName())

	unsigned long fileSize = file->sizeOf();
	DEBUG(4, ComponentAssemblyParser,
	    "[ComponentAssemblyParser::Constructor] exit ...")
	CF::OctetSequence_var fileData;
	DEBUG(6, ComponentAssemblyParser, "IN constructor four step")
	file->read(fileData, fileSize);
	DEBUG(6, ComponentAssemblyParser, "IN constructor five step")
	m_fileName = file->fileName();

	DEBUG(6, ComponentAssemblyParser, "IN constructor second step")
	unsigned char *fileBuffer = fileData->get_buffer();

	m_xmlDoc.Parse((const char *)fileBuffer);

	DEBUG(6, ComponentAssemblyParser, "In constructor third step")
	// Handle SAD or DCD files
	m_root = m_xmlDoc.FirstChild("softwareassembly");
	if (!m_root)
		m_root = m_xmlDoc.FirstChild("deviceconfiguration");

	TiXmlHandle docHandle(m_root);

	parseIdAndName (docHandle);
	parseConnections (docHandle);

	DEBUG(4, ComponentAssemblyParser,
	    "[ComponentAssemblyParser::Constructor] exit ...")
}

ComponentAssemblyParser::ComponentAssemblyParser(
    std::string fileName) {
	DEBUG(6, ComponentAssemblyParser, "Entering constructor with" << fileName)

	int pos = fileName.find_last_of("/");
	m_fileName = fileName.substr(pos + 1);

	std::ifstream fileIn(fileName.c_str());

	std::stringstream buffer;
	buffer << fileIn.rdbuf();
	std::string contents(buffer.str());

	m_xmlDoc.Parse(contents.c_str());
	DEBUG(6, ComponentAssemblyParser, "In constructor third step")
	// Handle SAD or DCD files
	m_root = m_xmlDoc.FirstChild("softwareassembly");
	if (!m_root)
		m_root = m_xmlDoc.FirstChild("deviceconfiguration");

	TiXmlHandle docHandle(m_root);
	parseIdAndName (docHandle);
	parseConnections (docHandle);

	fileIn.close();

	DEBUG(4, ComponentAssemblyParser,
	    "[ComponentAssemblyParser::Constructor] exit ...")
}

ComponentAssemblyParser::~ComponentAssemblyParser() {
	for (int i = 0; i < connections.size(); i++) {
		if (connections[i]) {
			delete connections[i];
			connections[i] = NULL;
		}
	}
}

std::vector <Connection*> *
ComponentAssemblyParser::getConnections() {
	return &connections;
}

const char *
ComponentAssemblyParser::getFileName() {
	return m_fileName.c_str();
}

const char *
ComponentAssemblyParser::getID() {
	return m_id.c_str();
}

const char *
ComponentAssemblyParser::getName() {
	return m_name.c_str();
}

void
ComponentAssemblyParser::parseConnections(
    TiXmlHandle & docHandle) {
	DEBUG(4, ComponentAssemblyParser, "In parseConnections.");

	TiXmlElement * connection =
	    docHandle.FirstChild("connections").FirstChild(
	    	"connectinterface").ToElement();

	for (; connection; connection = connection->NextSiblingElement()) {
		DEBUG(4, ComponentAssemblyParser, 
			"In parseConnections to parse connection.");
		connections.push_back(new Connection(connection));
	}
}

void
ComponentAssemblyParser::parseIdAndName(
    TiXmlHandle & docHandle) {
	DEBUG(4, ComponentAssemblyParser, "In parseIdAndName.");

	TiXmlElement * SWAssembly = docHandle.Element();
	if (!SWAssembly) {
		DEBUG(2, ComponentAssemblyParser, 
			"Failed to retrieve root element tag.");
		throw CF::ApplicationFactory::CreateApplicationError(CF::CFNOTSET ,
		        "XML tag software assembly not found.");
	}

	m_id = SWAssembly->Attribute("id");
	m_name = SWAssembly->Attribute("name");
}

/**
 * class OPENSCAPARSER_API ComponentInstantiation
 */
ComponentInstantiation::ComponentInstantiation(
    TiXmlElement * elem):
	m_root(elem) {
	DEBUG(4, ComponentInstantiation, "In constructor.");
	parseElement();
}

ComponentInstantiation::~ComponentInstantiation() {

}

const char *
ComponentInstantiation::getID() {
	return m_instantiationId.c_str();
}

std::vector <InstantiationProperty*> *
ComponentInstantiation::getProperties() {
	return &m_properties;
}

const char *
ComponentInstantiation::getUsageName() {
	return m_usageName.c_str();
}

void
ComponentInstantiation::parseElement() {
	parseID(m_root);
	parseName(m_root);
	parseProperties(m_root);

}

void
ComponentInstantiation::parseID(
    TiXmlElement * elem) {
	DEBUG(4, ComponentInstantiation, "In parseID.");

	m_instantiationId = elem->Attribute("id");

	DEBUG(5, ComponentInstantiation, 
		"Found instantiation ID " << m_instantiationId);
}

void
ComponentInstantiation::parseName(
    TiXmlElement * elem) {
	DEBUG(4, ComponentInstantiation, "In parseName.");

	TiXmlElement *usage = elem->FirstChildElement("usagename");
	if (usage)
		m_usageName = usage->GetText();

	DEBUG(5, ComponentInstantiation, "Found usage name " << m_usageName);
}

void
ComponentInstantiation::parseProperties(
    TiXmlElement * elem) {
	DEBUG(4, ComponentInstantiation, "In parseProperties.");

	TiXmlElement * cp = elem->FirstChildElement("componentproperties");
	if (cp) {
		TiXmlElement * prop = cp->FirstChildElement();

		for (; prop; prop = prop->NextSiblingElement()) {
			std::string str = prop->GetText();

			DEBUG(5, ComponentInstantiation, "Found prop: " << str)

			if (str == "simpleref") {
				DEBUG(5, ComponentInstantiation, "Found simpleref.");
				InstantiationProperty * i_prop = parseSimpleRef (prop);
				m_properties.push_back(i_prop);

			} else if (str == "simplesequenceref") {
				DEBUG(5, ComponentInstantiation, "Found simplesequence.");
				InstantiationProperty * i_prop = parseSimpleSequenceRef (prop);
				m_properties.push_back(i_prop);
			}
		}
	}
	DEBUG(4, ComponentInstantiation, "Leaving parseProperties.");
}

InstantiationProperty *
ComponentInstantiation::parseSimpleRef(
    TiXmlElement * elem) {
	DEBUG(4, ComponentInstantiation, "In parseSimpleRef.");

	const char * id = elem->Attribute("refid");
	const char * value = elem->Attribute("value");

	InstantiationProperty * property = new InstantiationProperty(id, value);
	return property;
}

InstantiationProperty *
ComponentInstantiation::parseSimpleSequenceRef(
    TiXmlElement * elem) {
	DEBUG(4, ComponentInstantiation, "In parseSimpleSequence.");

	const char * id = elem->Attribute("refid");

	DEBUG(5, ComponentInstantiation, "Found refid: " << id);

	InstantiationProperty * property = new InstantiationProperty(id);

	TiXmlElement * values = elem->FirstChildElement("values");
	TiXmlElement * value = values->FirstChildElement("value");
	DEBUG(5, ComponentInstantiation, "Found value.");

	for (; value; value = value->NextSiblingElement("value")) {
		DEBUG(5, ComponentInstantiation, "Found value: " << value->GetText());
		property->setValue(value->GetText());
	}

	return property;
}

/**
 * class OPENSCA_PARSER_API ComponentPlacement
 */
ComponentPlacement::ComponentPlacement(
    TiXmlElement * element):
	m_root(element) {
	DEBUG(4, ComponentPlacement, "In constructor.")
	parseElement(element);
}

ComponentPlacement::~ComponentPlacement() {
	DEBUG(4, ComponentPlacement, "In denstructor")
}

const char *
ComponentPlacement::getFileRefId() {
	DEBUG(4, ComponentPlacement, "In getFileRefId")
	return m_fileRefId.c_str();
}

ComponentInstantiation *
ComponentPlacement::getInstantiationById(
    const char * id) {
	DEBUG(4, ComponentPlacement, "In getInstantiationById.")

	for (unsigned int i = 0; i < m_instantiations.size(); i++) {
		if (strcmp (m_instantiations[i]->getID (), id) == 0)
			return m_instantiations[i];
	}

	return NULL;
}

std::vector <ComponentInstantiation*> *
ComponentPlacement::getInstantiations() {
	DEBUG(4, ComponentPlacement, "In getInstantiations.")
	return &m_instantiations;
}

void
ComponentPlacement::parseElement(
    TiXmlElement * elem) {
	parseFileRef(elem);
}

void
ComponentPlacement::parseFileRef(
    TiXmlElement * elem) {
	DEBUG(4, ComponentPlacement, "In parseFileRef.")

	if (elem) {
		TiXmlElement *fileRef = elem->FirstChildElement("componentfileref");
		if (fileRef ) {
			m_fileRefId = fileRef->Attribute("refid");
		}

	} else {
		//Invalid Profile
		std::cerr << "Invalid profile cannot parse the refid \
			in componentplacement" << std::endl;
	}
}

/**
 * class OPENSCA_PARSER_API InstantiationProperty
 */
InstantiationProperty::InstantiationProperty(
    const char * id):
	m_id(id) {

}

InstantiationProperty::InstantiationProperty(
    const char * id,
    const char * value):
	m_id(id) {
	m_values.push_back(value);
}

InstantiationProperty::~InstantiationProperty() {

}

const char *
InstantiationProperty::getID() {
	return m_id.c_str();
}

const std::vector<std::string>
InstantiationProperty::getValues() {
	return m_values;
}

void
InstantiationProperty::setID(
    const char * id) {
	m_id = id;
}

void
InstantiationProperty::setValue(
    const char * value) {
	m_values.push_back(value);
}

/**
* class OPENSCA_PARSER_API ComponentSupportedInterface
*/
ComponentSupportedInterface::ComponentSupportedInterface(
    TiXmlElement* element):
	m_identifier(""),
	m_componentInstantiationRefId(""),
	m_ifComponentInstantiationRef(false),
	m_ifFindBy(false),
	m_theFindBy(NULL) {
	DEBUG(4, ComponentSupportedInterface, "In constructor.")

	parseID(element);
	parseComponentInstantiationRef(element);
}

ComponentSupportedInterface::~ComponentSupportedInterface() {

}

const char *
ComponentSupportedInterface::getComponentInstantiationRefId() {
	return m_componentInstantiationRefId.c_str();
}

FindBy *
ComponentSupportedInterface::getFindBy() const {
	return m_theFindBy;
}

const char *
ComponentSupportedInterface::getID() {
	return m_identifier.c_str();
}

bool
ComponentSupportedInterface::isComponentInstantiationRef() {
	return m_ifComponentInstantiationRef;
}

bool ComponentSupportedInterface::isFindBy() {
	return m_ifFindBy;
}

void
ComponentSupportedInterface::parseComponentInstantiationRef(
    TiXmlElement * elem) {
	DEBUG(9, ComponentSupportedInterface, "In parseComponentInstantiationRef")
	TiXmlElement * id = elem->FirstChildElement("componentinstantiationref");
	DEBUG(9, ComponentSupportedInterface, "Parsed ID")
	m_componentInstantiationRefId = id->Attribute("refid");
	DEBUG(9, ComponentSupportedInterface, "Parsed Reference ID")
}

void
ComponentSupportedInterface::parseID(
    TiXmlElement * elem) {
	DEBUG(9, ComponentSupportedInterface, "In parseID")
	TiXmlElement * id = elem->FirstChildElement("supportedidentifier");
	DEBUG(9, ComponentSupportedInterface, "Parsed ID")
	m_identifier = id->GetText();
}

/**
* class OPENSCA_PARSER_API PropertyFile
*/
PropertyFile::PropertyFile(
    TiXmlElement * elem) {
	DEBUG(4, PropertyFile, "In constructor.");
	parseElement(elem);
}

PropertyFile::~PropertyFile() {
}

void
PropertyFile::parseElement(
    TiXmlElement * elem) {
	DEBUG(4, PropertyFile, "in parseElement");
	parseAttributes(elem); // get type from propertyfile tag
	parseChildElements(elem); // parse localfile tag
}

void
PropertyFile::parseAttributes(
    TiXmlElement * elem) {
	DEBUG(4, PropertyFile, "in parseAttributes");

	// verify attribute exists before parsing to prevent seg fault
	if (elem->Attribute("type")) {
		m_type = elem->Attribute("type");
	} else {
		DEBUG(4, PropertyFile,
		    "ERROR: Could not find 'type' attribute within propertyfile tag" )
		exit(-1);
	}
}

void
PropertyFile::parseChildElements(
    TiXmlElement * elem) {
	DEBUG(4, PropertyFile, "in parseChildElements");

	TiXmlElement * local = elem->FirstChildElement("localfile");
	if (local) {
		m_localfile = local->Attribute("name");
	} else {
		DEBUG(4, PropertyFile,
		    "ERROR: Could not find 'name' attribute within localfile tag" )
		exit(-1);
	}
}

std::string
PropertyFile::getType() {
	return m_type;
}

std::string
PropertyFile::getLocalFile() {
	return m_localfile;
}
