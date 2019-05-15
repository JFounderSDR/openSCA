/***************************************************************************//**
* @file     SADParser.h
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

#if !defined(EA_73DFE8B8_A4E2_4f06_B41A_BFED4E1876CE__INCLUDED_)
#define EA_73DFE8B8_A4E2_4f06_B41A_BFED4E1876CE__INCLUDED_

#include <iostream>
#include <vector>

#include "debug.h"
#include "parser_helpers.h"
#include "port_helpers.h"
#include "Boost_utils.h"

class SADComponentPlacement;
class SADComponentInstantiation;
class SADHostCollocation;
class SADComponentFile;

/**
 * class OPENSCAPARSER_API SADParser:public ComponentAssemblyParser
 */
class SADParser :
	public ComponentAssemblyParser {

  public:
	SADParser(CF::File_ptr file);

	~SADParser();

	SADComponentInstantiation *
	getAssemblyController();

	const char *
	getAssemblyControllerRefId();

	std::vector <SADComponentPlacement* > *
	getComponents();

	std::vector <SADComponentPlacement* > *
	getCorbaComponents();

	std::vector <SADComponentPlacement* > *
	getNonCorbaComponents();

	std::vector <ExternalPort* > *
	getExternalPorts();

	std::vector <SADHostCollocation* > *
	getHostCollocations();

	const char *
	getSADFilename();

	const char *
	getSPDById(const char * refid);

  protected:
	SADComponentInstantiation * m_assemblyControllerInstantiation;
	std::vector <SADComponentFile*> m_componentFiles;
	std::vector <SADComponentPlacement*> m_components;
	std::vector <SADComponentPlacement*> m_corbaComps;
	std::vector <SADComponentPlacement*> m_nonCorbaComps;
	std::vector <ExternalPort*> m_externalPorts;
	std::vector <SADHostCollocation*> m_hostCollocations;

	void
	parseAssemblyController(
	    TiXmlHandle docHandle);

	void
	parseComponentFiles(
	    TiXmlHandle docHandle);

	void
	parseComponents(
	    TiXmlHandle docHandle);

	void
	parseExternalPorts(
	    TiXmlHandle docHandle);

	void
	parseFile(
	    TiXmlHandle docHandle);

	void
	parseHostCollocation(
	    TiXmlHandle docHandle);

  private:
	/**
	 * No copying
	 */
	std::string m_assemblyControllerRefId;

	SADParser();

	SADParser(
	    const SADParser & aSADParser);
};

/**
 * class openscaPARSER_API SADComponentPlacement:public ComponentPlacement
 */
class SADComponentPlacement :
	public ComponentPlacement {

  public:
	SADComponentPlacement(
	    TiXmlElement * elem);

	virtual ~SADComponentPlacement();

	SADComponentInstantiation *
	getSADInstantiationById(
	    char * _id) const;

	std::vector <SADComponentInstantiation*> *
	getSADInstantiations();

	bool
	isScaCompliant();

	bool
	setScaCompliant(
	    bool scaCompliant);

  protected:
	std::vector <SADComponentInstantiation*> sadComp;

	void
	parseElement(
	    TiXmlElement * elem);

	void
	parseInstantiations(
	    TiXmlElement * elem);

  private:
	SADComponentPlacement();

	SADComponentPlacement(
	    SADComponentPlacement & prm1);

	bool m_scaCompliant;
};

/**
 * class openscaPARSER_API SADComponentInstantiation:public ComponentInstantiation
 */
class SADComponentInstantiation :
	public ComponentInstantiation {

  public:
	SADComponentInstantiation(
	    TiXmlElement * elem);

	virtual ~SADComponentInstantiation();

	std::vector <InstantiationProperty*> *
	getFactoryProperties();

	const char *
	getFindByNamingServiceName();

	const char *
	getResourceFactoryRefId();

	bool
	isNamingService();

	bool
	isResourceFactoryRef();

  protected:
	void
	parseElement();

	void
	parseFindComponent(
	    TiXmlElement * elem);

  private:
	std::vector <InstantiationProperty*> m_factoryProperties;
	std::string m_findByNamingServiceName;
	bool m_ifNamingService;
	bool m_ifResourceFactoryRef;
	std::string m_resourceFactoryRefId;

	SADComponentInstantiation();

	SADComponentInstantiation(
	    const SADComponentInstantiation & compInst);
};

/**
 * class openscaPARSER_API SADHostCollocation
 */
class SADHostCollocation {

  public:
	SADHostCollocation(
	    const char * id,
	    const char * name,
	    std::vector <SADComponentPlacement*> collocatedComponents);

	~SADHostCollocation();

	std::vector <SADComponentPlacement*>
	getComponents() const;

	const char *
	getID();

	const char *
	getName();

  protected:
	std::vector<SADComponentPlacement*> m_collocatedComponents;
	std::string m_id;
	std::string m_name;

  private:
	SADHostCollocation();

	SADHostCollocation(
	    const SADHostCollocation & prm1);
};

class SADComponentFile {
  public:
	SADComponentFile(
	    TiXmlElement * elem);

	~SADComponentFile();

	const char *
	getType() {return m_type.c_str(); };

	const char *
	getId() { return m_id.c_str(); };

	const char *
	getFileName() { return m_fileName.c_str(); };



  private:
	SADComponentFile(); // No default constructor

	SADComponentFile(
	    const SADComponentFile &); // No copy constructor

	void
	parseElement(
	    TiXmlElement * elem);

	std::string m_type, m_id, m_fileName;
};

#endif // !defined(EA_73DFE8B8_A4E2_4f06_B41A_BFED4E1876CE__INCLUDED_)