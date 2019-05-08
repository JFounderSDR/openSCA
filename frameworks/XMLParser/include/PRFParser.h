/***************************************************************************//**
* @file     PRFParser.h
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

#if !defined(EA_E8E0ED2F_1A82_4672_B48C_32F31CBF2979__INCLUDED_)
#define EA_E8E0ED2F_1A82_4672_B48C_32F31CBF2979__INCLUDED_

#include <string>
#include <vector>
#include <map>

#include "prop_helpers.h"
#include "CFS.h"
#include "debug.h"
#include "tinyxml.h"

class PRFSimpleProperty;
class PRFProperty;
class PRFSimpleSequenceProperty;

typedef std::map<std::string, std::string> ExecParamsType;

/**
 * this class is designed to parse PRFxml. parse the whole file when the class is
 * instantiated, and the step of parsing file only occur one time. all properties
 * value are stored in memory by std::vector pattern so as to be call.
 */
class PRFParser {

  public:
	PRFParser(
	    CF::File_ptr file);

	PRFParser(
	    std::string fileName);

	~PRFParser();

	std::vector <PRFProperty *> *
	getCapacityProperties();

	std::vector <PRFProperty *> *
	getConfigureProperties();

	std::vector <PRFProperty *> *
	getExecParamProperties();

	ExecParamsType
	getExecParams();

	std::vector <PRFProperty *> *
	getFactoryParamProperties();

	std::vector <PRFProperty *> *
	getMatchingProperties();

	std::vector <PRFProperty *> *
	getProperties();

  protected:
	void
	addProperty(PRFProperty * sp);

	void
	parseFile(TiXmlElement * elem);

  private:
	std::vector<PRFProperty *> m_allProperties;
	std::vector<PRFProperty *> m_capacityProperties;
	std::vector<PRFProperty *> m_configProperties;
	std::vector<PRFProperty *> m_execProperties;
	std::vector<PRFProperty *> m_factoryProperties;
	std::vector<PRFProperty *> m_matchingProperties;
	ExecParamsType m_execParams;

	TiXmlDocument m_xmlDoc;

	PRFParser();

	PRFParser(
	    PRFParser & prf);
};

/**
 * this class is base class of property. it provide many operation to get or
 * change property.
 */
class PRFProperty {

  public:
	PRFProperty(
	    TiXmlElement * elem);

	virtual ~PRFProperty();

	const char *
	getAction();

	CF::DataType *
	getDataType() const;

	const char *
	getID();

	std::vector <std::string>
	getKinds();

	const char *
	getMode();

	const char *
	getName();

	const char *
	getType();

	std::vector <std::string>
	getValue();

	bool
	isAllocation();

	bool
	isBoolean();

	bool
	isChar();

	bool
	isConfigure();

	bool
	isDouble();

	bool
	isEqual();

	bool
	isExecParam();

	bool
	isExternal();

	bool
	isFactoryParam();

	bool
	isFloat();

	bool
	isGreaterThan();

	bool
	isGreaterThanOrEqual();

	bool
	isLessThan();

	bool
	isLessThanOrEqual();

	bool
	isLong();

	bool
	isNotEqual();

	bool
	isObjref();

	bool
	isOctet();

	bool
	isReadOnly();

	bool
	isReadWrite();

	bool
	isShort();

	bool
	isString();

	bool
	isTest();

	bool
	isULong();

	bool
	isUShort();

	bool
	isUshort();

	bool
	isWriteOnly();

  protected:
	CF::DataType * m_dataType;
	std::vector<std::string> m_value;

  private:
	std::string m_action;
	std::string m_id;
	std::string m_mode;
	std::string m_name;
	std::vector <std::string> m_simpleKinds;
	std::string m_type;

	PRFProperty();

	PRFProperty(
	    const PRFProperty & _prfSimpleProp);

	void
	parseAction(
	    TiXmlElement * elem);

	void
	parseElement(
	    TiXmlElement * elem);

	void
	parseKind(
	    TiXmlElement * elem);
};

/**
 * this class is designed to parse "simpleProperty" element.
 */
class PRFSimpleProperty :
	public PRFProperty {

  public:
	PRFSimpleProperty(
	    TiXmlElement* elem);
	virtual ~PRFSimpleProperty();

  private:
	PRFSimpleProperty();

	PRFSimpleProperty(
	    const PRFSimpleProperty & prm1);

	void
	extract_strings_from_element(
	    TiXmlElement * elem,
	    std::vector<std::string> & values);
};

/**
 * this class is designed to parse "simpleSequenceProperty" element.
 */
class PRFSimpleSequenceProperty : public PRFProperty {

  public:
	PRFSimpleSequenceProperty(
	    TiXmlElement * elem);

	virtual ~PRFSimpleSequenceProperty();

  private:
	PRFSimpleSequenceProperty();

	PRFSimpleSequenceProperty(
	    const PRFSimpleSequenceProperty & prm1);

	void
	extract_strings_from_element(
	    TiXmlElement * elem,
	    std::vector<std::string> & values);
};

#endif // !defined(EA_E8E0ED2F_1A82_4672_B48C_32F31CBF2979__INCLUDED_)