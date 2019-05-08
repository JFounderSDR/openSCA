/***************************************************************************//**
* @file     parser_helpers.h
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

#if !defined(EA_8F90F9B5_56F9_4798_9431_6970B4A91696__INCLUDED_)
#define EA_8F90F9B5_56F9_4798_9431_6970B4A91696__INCLUDED_

#include <vector>
#include <iostream>
#include <fstream>
#include <sstream>

#include "tinyxml.h"
#include "debug.h"
#include "CFS.h"
#include "port_helpers.h"

class ComponentPlacement;
class InstantiationProperty;
class ComponentSupportedInterface;
class PropertyFile;
class Connection;
class FindBy;

/**
 * This class is designed to parse assembly component consisted of 
 * SAD and SCD. it provide parseConnections and parseIdandName operations.
 */
class ComponentAssemblyParser {

  public:
	ComponentAssemblyParser(
	    CF::File_ptr file);

	ComponentAssemblyParser(
	    std::string fileName);

	virtual ~ComponentAssemblyParser();

	std::vector <Connection*> *
	getConnections();

	const char *
	getFileName();

	const char *
	getID();

	const char *
	getName();

  protected:
	std::vector <Connection*> connections;
	/**
	 * the file name for a given DCD or SAD Profile
	 */
	std::string m_fileName;
	/**
	 * the id of the root node
	 */
	std::string m_id;
	/**
	 * the name of the root node
	 */
	std::string m_name;
	TiXmlNode * m_root;
	TiXmlDocument m_xmlDoc;

	void
	parseConnections(
	    TiXmlHandle & docHandle);

	void
	parseIdAndName(
	    TiXmlHandle & docHandle);

  private:
	ComponentAssemblyParser();

	ComponentAssemblyParser(
	    const ComponentAssemblyParser & prm1);
};

/**
 * class openscaPARSER_API ComponentInstantiation
 */
class ComponentInstantiation {

  public:
	ComponentInstantiation(
	    TiXmlElement * elem);

	virtual ~ComponentInstantiation();

	const char *
	getID();

	std::vector <InstantiationProperty*> *
	getProperties();

	const char *
	getUsageName();

  protected:
	TiXmlElement * m_root;

	void
	parseElement();

	void
	parseID(
	    TiXmlElement * elem);

	void
	parseName(
	    TiXmlElement * elem);

	void
	parseProperties(
	    TiXmlElement * elem);

	InstantiationProperty *
	parseSimpleRef(
	    TiXmlElement * elem);

	InstantiationProperty *
	parseSimpleSequenceRef(
	    TiXmlElement * elem);

  private:
	/**
	 * No copying
	 */
	std::string m_instantiationId;
	std::vector <InstantiationProperty*> m_properties;
	std::string m_usageName;

	ComponentInstantiation();

	ComponentInstantiation(
	    const ComponentInstantiation & elem);
};

/**
 * class openscaPARSER_API ComponentPlacement
 */
class ComponentPlacement {

  public:
	ComponentPlacement(
	    TiXmlElement * element);

	virtual ~ComponentPlacement();

	const char *
	getFileRefId();

	ComponentInstantiation *
	getInstantiationById(
	    const char * id);

	std::vector <ComponentInstantiation*> *
	getInstantiations();

  protected:
	std::string m_fileRefId;
	std::vector <ComponentInstantiation*> m_instantiations;
	TiXmlElement * m_root;

	void
	parseElement(
	    TiXmlElement * elem);

	void
	parseFileRef(
	    TiXmlElement * elem);

  private:
	ComponentPlacement();

	ComponentPlacement(
	    const ComponentPlacement & CP);
};

/**
 * class openscaPARSER_API InstantiationProperty
 */
class InstantiationProperty {

  public:
	InstantiationProperty(
	    const char * id);

	InstantiationProperty(
	    const char * id,
	    const char * value);

	~InstantiationProperty();

	const char *
	getID();

	const std::vector<std::string>
	getValues();

	void
	setID(
	    const char * id);

	void
	setValue(
	    const char * value);

  private:
	std::string m_id;
	std::vector<std::string> m_values;

	InstantiationProperty();

	InstantiationProperty(
	    const InstantiationProperty & prf);
};

class ComponentSupportedInterface {

  public:
	ComponentSupportedInterface(
	    TiXmlElement * element);

	~ComponentSupportedInterface();

	const char *
	getComponentInstantiationRefId();

	FindBy *
	getFindBy() const;

	const char *
	getID();

	bool
	isComponentInstantiationRef();

	bool
	isFindBy();

  private:
	std::string m_componentInstantiationRefId;
	std::string m_identifier;
	bool m_ifComponentInstantiationRef;
	bool m_ifFindBy;
	FindBy * m_theFindBy;

	ComponentSupportedInterface();

	ComponentSupportedInterface(
	    const ComponentSupportedInterface & csi);

	void
	parseComponentInstantiationRef(
	    TiXmlElement * elem);

	void
	parseID(
	    TiXmlElement * elem);
};

class  PropertyFile {
  public:
	PropertyFile(
	    TiXmlElement * elem);

	~PropertyFile();

	std::string
	getType();

	std::string
	getLocalFile();

  protected:
	void
	parseElement(
	    TiXmlElement * elem);

	void
	parseAttributes(
	    TiXmlElement * elem);

	void
	parseChildElements(
	    TiXmlElement * elem);

  private:
	PropertyFile(); // no default constructor

	PropertyFile(
	    const PropertyFile & propertyFile); // no copying

	std::string m_type;
	std::string m_localfile;

};

#endif // !defined(EA_8F90F9B5_56F9_4798_9431_6970B4A91696__INCLUDED_)