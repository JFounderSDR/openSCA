/***************************************************************************//**
* @file     PRFParser.cpp
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

#include "../include/PRFParser.h"
#include "../include/debug.h"

/**
 * this class is designed to parse PRFxml. parse the whole file when the class is
 * instantiated, and the step of parsing file only occur one time. all properties
 * value are stored in memory by std::vector pattern so as to be call.
 */
PRFParser::PRFParser(
    CF::File_ptr file) {
	DEBUG(4, PRFParser, 
		"In constructor with filename is: " << file->fileName())

	unsigned long fileSize = file->sizeOf();
	CF::OctetSequence_var fileData;

	file->read(fileData, fileSize);

	unsigned char * fileBuffer = fileData->get_buffer();

	m_xmlDoc.Parse((const char *)fileBuffer);

	TiXmlElement * elem = m_xmlDoc.FirstChildElement("properties");
	if (!elem) {
		unsigned err_col = m_xmlDoc.ErrorCol();
		unsigned err_row = m_xmlDoc.ErrorRow();
		std::string _fn = file->fileName();

		DEBUG(4, PRFParser, "[PRFParser::PRFParser]Exception:error occur at row:" <<
		      err_row << "and col:" << err_col << "when parse " << _fn.c_str())
	}

	parseFile(elem);
}

PRFParser::PRFParser(
    std::string fileName) {
	DEBUG(4, PRFParser, "In constructor with filename is: " << fileName)

	std::ifstream fileIn(fileName.c_str());

	std::stringstream buffer;
	buffer << fileIn.rdbuf();
	std::string contents(buffer.str());

	m_xmlDoc.Parse(contents.c_str());
	TiXmlElement * elem = m_xmlDoc.FirstChildElement("properties");
	if (!elem) {
		unsigned err_col = m_xmlDoc.ErrorCol();
		unsigned err_row = m_xmlDoc.ErrorRow();

		DEBUG(4, PRFParser::PRFParser, "Exception:error occur at row:" <<
		    err_row << "and col:" << err_col << 
		    "when parse " << fileName.c_str())
		fileIn.close();
		throw CF::FileException();
	}

	parseFile(elem);

	fileIn.close();
}

PRFParser::~PRFParser() {
	DEBUG(4, PRFParser, "In PRFParse destructor.");

	for (unsigned int i = 0; i < m_allProperties.size(); i++)
		delete m_allProperties[i];
}

void
PRFParser::addProperty(
    PRFProperty * prop) {
	DEBUG(7, PRFParser::addProperty, "In addProperty.")

	if (prop->isAllocation ()) {
		m_matchingProperties.push_back (prop);
		m_capacityProperties.push_back (prop);
	} else {
		if (prop->isConfigure ()) {
			DEBUG(5, PRFParser::addProperty, 
				"storing configure property: " << prop->getName())

			m_configProperties.push_back (prop);
		} else if (prop->isExecParam ()) {
			DEBUG(5, PRFParser::addProperty, 
				"storing executive property: " << prop->getName() << 
				"---" << prop->getValue()[0])

			m_execProperties.push_back (prop);
			m_execParams.insert(std::pair<std::string, std::string>
			    (prop -> getName(), (prop->getValue())[0]));

		} else if (prop->isFactoryParam ()) {
			DEBUG(5, PRFParser::addProperty, 
				"storing factory property: " << prop->getName())
			m_factoryProperties.push_back (prop);
		} else {
			DEBUG(5, PRFParser::addProperty, 
				"could not find the appropriate property type, deleting.")

			delete prop;
		}
	}
}

std::vector <PRFProperty *> *
PRFParser::getCapacityProperties() {
	DEBUG(5, PRFParser::getCapacityProperties, 
		"In PRFParser::getCapacityProperties")
	return &m_capacityProperties;
}

std::vector <PRFProperty *> *
PRFParser::getConfigureProperties() {
	DEBUG(5, PRFParser::getConfigureProperties, 
		"In PRFParser::getConfigureProperties")
	return &m_configProperties;
}

std::vector <PRFProperty *> *
PRFParser::getExecParamProperties() {
	DEBUG(5, PRFParser::getExecParamProperties, 
		"In PRFParser::getExecParamProperties")
	return &m_execProperties;
}

ExecParamsType
PRFParser::getExecParams() {
	return m_execParams;
}

std::vector <PRFProperty *> *
PRFParser::getFactoryParamProperties() {
	DEBUG(5, PRFParser::getFactoryParamProperties, 
		"In PRFParser::getFactoryParamProperties")
	return &m_factoryProperties;
}


std::vector <PRFProperty *> *
PRFParser::getMatchingProperties() {
	DEBUG(5, PRFParser::getMatchingProperties, 
		"In PRFParser::getMatchingProperties")
	return &m_matchingProperties;
}


std::vector <PRFProperty *> *
PRFParser::getProperties() {
	DEBUG(5, PRFParser::getProperties, 
		"In PRFParser::getProperties")
	return &m_allProperties;
}

void
PRFParser::parseFile(
    TiXmlElement * elem) {
	DEBUG(4, PRFParser::parseFile, "In parseFile");

	TiXmlElement * prop = elem->FirstChildElement();

	for ( ; prop; prop = prop->NextSiblingElement()) {
		std::string str = prop->Value();
		if (str == "simple") 
			addProperty (new PRFSimpleProperty(prop));
		if (str == "simplesequence") 
			addProperty (new PRFSimpleSequenceProperty(prop));
	}
	DEBUG(5, PRFParser, "Done processing property entries");

	for (unsigned int i = 0; i < m_configProperties.size(); i++)
		m_allProperties.push_back (m_configProperties[i]);

	for (unsigned int i = 0; i < m_matchingProperties.size (); i++)
		m_allProperties.push_back (m_matchingProperties[i]);

	for (unsigned int i = 0; i < m_execProperties.size (); i++)
		m_allProperties.push_back (m_execProperties[i]);

	for (unsigned int i = 0; i < m_factoryProperties.size (); i++)
		m_allProperties.push_back (m_factoryProperties[i]);

	DEBUG(7, PRFParser::parseFile, 
		"In ParserFile with m_allProperties length is: " << m_allProperties.size())
	DEBUG(7, PRFParser::parseFile, 
		"In ParserFile with m_configProperties length is: " << 
		m_configProperties.size())
}

/**
 * this class is designed to parse "simpleProperty" element.
 */
PRFSimpleProperty::PRFSimpleProperty(
    TiXmlElement * elem):
	PRFProperty(elem) {
	DEBUG(7, PRFParser::PRFSimpleProperty, "enter in PRFSimpleProperty")
	extract_strings_from_element(elem, m_value);

	if (m_value.size() < 1) {
		return;
	}

	if (isBoolean()) {
		m_dataType->value <<=
		    CORBA::Any::from_boolean(openscaSupport::strings_to_boolean(m_value));
	} else if (isChar()) {
		m_dataType->value <<=
		    CORBA::Any::from_char(openscaSupport::strings_to_char(m_value));
	} else if (isDouble()) {
		m_dataType->value <<= openscaSupport::strings_to_double(m_value);
	} else if (isFloat()) {
		m_dataType->value <<= openscaSupport::strings_to_float(m_value);
	} else if (isShort()) {
		m_dataType->value <<= openscaSupport::strings_to_short(m_value);
	} else if (isLong()) {
		m_dataType->value <<= openscaSupport::strings_to_long(m_value);
	} else if (isOctet()) {
		m_dataType->value <<= CORBA::Any::from_octet(
								openscaSupport::strings_to_octet(m_value));
	} else if (isUShort()) {
		m_dataType->value <<= openscaSupport::strings_to_unsigned_short(m_value);
	} else if (isULong()) {
		m_dataType->value <<= openscaSupport::strings_to_unsigned_long(m_value);
	} else if (isString()) {
		m_dataType->value <<= m_value[0].c_str();
	}

	DEBUG(7, PRFParser::PRFSimpleProperty, "leaving PRFSimpleProperty")
}

PRFSimpleProperty::~PRFSimpleProperty() {

}

void
PRFSimpleProperty::extract_strings_from_element(
    TiXmlElement * elem,
    std::vector<std::string> & values) {
	TiXmlElement * val = elem->FirstChildElement("value");

	if (val) {
		std::string str = val->GetText();
		values.push_back(str);
	}
}

/**
 * this class is base class of property. it provide many operation to get or
 * change property.
 */
PRFProperty::PRFProperty(
    TiXmlElement * elem) {
	DEBUG(4, PRFProperty, "In constructor.")
	m_dataType = new CF::DataType();
	parseElement(elem);
}

PRFProperty::~PRFProperty() {
	DEBUG(4, PRFProperty, "In destructor.")

	if (m_dataType) {
		delete m_dataType;
		m_dataType = NULL;
	}
}

const char *
PRFProperty::getAction() {
	return m_action.c_str();
}

CF::DataType *
PRFProperty::getDataType() const {
	return m_dataType;
}

const char *
PRFProperty::getID() {
	return m_id.c_str();
}

std::vector <std::string>
PRFProperty::getKinds() {
	return m_simpleKinds;
}

const char *
PRFProperty::getMode() {
	return m_mode.c_str();
}

const char *
PRFProperty::getName() {
	return m_name.c_str();
}

const char *
PRFProperty::getType() {
	return m_type.c_str();
}

std::vector <std::string>
PRFProperty::getValue() {
	return m_value;
}

bool
PRFProperty::isAllocation() {
	DEBUG(4, PRFProperty, "In isAllocation.");

	for (unsigned int i = 0; i < m_simpleKinds.size (); i++) {
		if (m_simpleKinds[i] == "allocation")
			return true;
	}

	return false;
}

bool
PRFProperty::isBoolean() {
	return (m_type == "boolean");
}

bool
PRFProperty::isChar() {
	return (m_type == "char");
}


bool
PRFProperty::isConfigure() {
	DEBUG(5, PRFProperty, "In isConfigure.");

	for (unsigned int i = 0; i < m_simpleKinds.size (); i++) {
		if (m_simpleKinds[i] == "configure")
			return true;
	}

	return false;
}

bool
PRFProperty::isDouble() {
	return (m_type == "double");
}

bool
PRFProperty::isEqual() {
	return (m_action == "eq");
}

bool
PRFProperty::isExecParam() {
	DEBUG(5, PRFProperty, "In isExecParam.");

	for (unsigned int i = 0; i < m_simpleKinds.size (); i++) {
		if (m_simpleKinds[i] == "execparam")
			return true;
	}

	return false;
}

bool
PRFProperty::isExternal() {
	return (m_action == "external");
}

bool
PRFProperty::isFactoryParam() {
	DEBUG(5, PRFProperty::isFactoryParam, "In isFactoryParam.");

	for (unsigned int i = 0; i < m_simpleKinds.size (); i++) {
		if (m_simpleKinds[i] == "factoryparam")
			return true;
	}

	return false;
}

bool
PRFProperty::isFloat() {
	return (m_type == "float");
}

bool
PRFProperty::isGreaterThan() {
	return (m_action == "gt");
}

bool
PRFProperty::isGreaterThanOrEqual() {
	return (m_action == "ge");
}

bool
PRFProperty::isLessThan() {
	return (m_action == "lt");
}

bool
PRFProperty::isLessThanOrEqual() {
	return (m_action == "le");
}

bool
PRFProperty::isLong() {
	return (m_type == "long");
}

bool
PRFProperty::isNotEqual() {
	return (m_action == "ne");
}

bool
PRFProperty::isObjref() {
	return (m_type == "objref");
}

bool
PRFProperty::isOctet() {
	return (m_type == "octet");
}

bool
PRFProperty::isReadOnly() {
	return (m_mode == "readonly");
}

bool
PRFProperty::isReadWrite() {
	return (m_mode == "readwrite");
}

bool
PRFProperty::isShort() {
	return (m_type == "short");
}

bool
PRFProperty::isString() {
	return (m_type == "string");
}

bool
PRFProperty::isTest() {
	DEBUG(5, PRFProperty, "In isTest.");

	for (unsigned int i = 0; i < m_simpleKinds.size (); i++) {
		if (m_simpleKinds[i] == "test")
			return true;
	}

	return false;
}

bool
PRFProperty::isULong() {
	return (m_type == "ulong");
}

bool
PRFProperty::isUShort() {
	return (m_type == "ushort");
}

bool
PRFProperty::isWriteOnly() {
	return (m_mode == "writeonly");
}

void
PRFProperty::parseAction(
    TiXmlElement * elem) {
	DEBUG(4, PRFProperty::parseAction, "In parseAction.");

	TiXmlElement * act = elem->FirstChildElement("action");

	if (act) {
		m_action = act->Attribute("type");
	} else {
		m_action = "external";
	}
}

void
PRFProperty::parseElement(
    TiXmlElement * elem) {
	DEBUG(4, PRFProperty::parseElement, "In parseElement.");

	m_id = elem->Attribute("id");
	m_dataType->id = CORBA::string_dup(m_id.c_str());
	m_type = elem->Attribute("type");
	m_name = elem->Attribute("name");
	m_mode = elem->Attribute("mode");

	parseKind(elem);
	parseAction(elem);
}

void
PRFProperty::parseKind(
    TiXmlElement * elem) {
	DEBUG(5, PRFProperty::parseKind, "In parseKind.");

	TiXmlElement * kind = elem->FirstChildElement("kind");
	assert(kind);

	DEBUG(5, PRFProperty::parseKind, "Looping through kind tags.");

	for ( ; kind; kind = kind->NextSiblingElement("kind")) {
		const char * str = kind->Attribute("kindtype");
		assert(str);
		m_simpleKinds.push_back(str);
	}
	DEBUG(5, PRFProperty::parseKind, "Leaving parseKind.");
}

/**
 * this class is designed to parse "simpleSequenceProperty" element.
 */
PRFSimpleSequenceProperty::PRFSimpleSequenceProperty(
    TiXmlElement * elem)
	: PRFProperty(elem) {
	DEBUG(4, PRFSimpleSequenceProperty, "In Constructor");

	TiXmlElement *vals = elem->FirstChildElement("values");
	extract_strings_from_element(vals, m_value);

	// The sequences should be freed when the datatype goes away
	if (isBoolean()) {
		m_dataType->value <<=
		    CORBA::Any::from_boolean(openscaSupport::strings_to_boolean(m_value));
	} else if (isChar()) {
		m_dataType->value <<=
		    CORBA::Any::from_char(openscaSupport::strings_to_char(m_value));
	} else if (isDouble()) {
		m_dataType->value <<= openscaSupport::strings_to_double(m_value);
	} else if (isFloat()) {
		m_dataType->value <<= openscaSupport::strings_to_float(m_value);
	} else if (isShort()) {
		m_dataType->value <<= openscaSupport::strings_to_short(m_value);
	} else if (isLong()) {
		m_dataType->value <<= openscaSupport::strings_to_long(m_value);
	} else if (isOctet()) {
		m_dataType->value <<= CORBA::Any::from_octet(
								openscaSupport::strings_to_octet(m_value));
	} else if (isUShort()) {
		m_dataType->value <<= openscaSupport::strings_to_unsigned_short(m_value);
	} else if (isULong()) {
		m_dataType->value <<= openscaSupport::strings_to_unsigned_long(m_value);
	} else if (isString()) {
		m_dataType->value <<= openscaSupport::strings_to_string(m_value);
	}
}

PRFSimpleSequenceProperty::~PRFSimpleSequenceProperty() {

}

void
PRFSimpleSequenceProperty::extract_strings_from_element(
    TiXmlElement * elem,
    std::vector<std::string> & values) {
	DEBUG(5, PRFSimpleSequenceProperty::extract_strings_from_element, 
		"Looking for values.");

	TiXmlElement * val = elem->FirstChildElement("value");

	DEBUG(8, PRFSimpleSequenceProperty::extract_strings_from_element, 
		"Found a value.");

	for ( ; val; val = val->NextSiblingElement("value")) {
		std::string str = val->GetText();
		DEBUG(8, PRFSimpleSequenceProperty::extract_strings_from_element, 
			"Found value: " << str);
		m_value.push_back(str);
	}
}
