/***************************************************************************//**
* @file     DCDParser.h
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

#if !defined(EA_F5F0DB21_243D_45f0_9EEF_B11945F9E4A9__INCLUDED_)
#define EA_F5F0DB21_243D_45f0_9EEF_B11945F9E4A9__INCLUDED_

#include <vector>
#include <iostream>

#include "parser_helpers.h"

class DCDComponentPlacement;
class componentFile;

/**
 * class OPENSCA_PARSER_API DCDParser:public ComponentAssemblyParser
 */
class DCDParser :
	public ComponentAssemblyParser {

  public:
	DCDParser(
	    CF::File_ptr file);

	DCDParser(
	    std::string fileName);

	virtual ~DCDParser();

	std::vector <componentFile>
	getComponentFiles();

	const std::vector <DCDComponentPlacement*> *
	getComponentPlacements();

	const char *
	getDCDFilename();

	const std::vector <DCDComponentPlacement*> *
	getDeployOnComponents();

	const std::vector<DCDComponentPlacement*> *
	getCompositepartofComponents();

	const char *
	getDeviceManagerSoftPkg();

	DCDComponentPlacement *
	getDomainManagerComponent() const;

	const char *
	getDomainManagerIOR();

	const char *
	getDomainManagerName();

	const char *
	getFileNameFromRefId(
	    const char * refid);

  protected:
	/* those component belong to compositepartofComponents */
	std::vector <DCDComponentPlacement * > m_deployOnComponents;
	/* maybe consiste of deployOnComponents */
	std::vector <DCDComponentPlacement * > m_compositepartofComponents;
	/* all components except compositepartofComponents */
	std::vector <DCDComponentPlacement * > m_componentPlacements;
	std::string m_deviceManagerSoftPkg;
	DCDComponentPlacement * m_domainManagerComponent;
	std::string m_domainManagerIOR;
	std::string m_domainManagerName;

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
	parseComponentPlacement(
	    TiXmlHandle docHandle);

	void
	parseDeviceManagerSoftPkg(
	    TiXmlHandle docHandle);

	void
	parseDomainManager(
	    TiXmlHandle docHandle);

	void
	parseLocalComponents(
	    TiXmlHandle docHandle);

  private:
	/**
	 * Don't allow copying
	 */
	std::vector<componentFile> m_componentFiles;

	DCDParser();

	DCDParser(
	    const DCDParser & dcdP);
};

/**
 * class OPENSCA_PARSER_API DCDComponentPlacement:public ComponentPlacement
 */
class DCDComponentPlacement :
	public ComponentPlacement {
  public:
	DCDComponentPlacement(
	    TiXmlElement * elem);

	~DCDComponentPlacement();

	const char *
	getCompositePartOfDeviceID();

	const char *
	getDeployOnDeviceID();

	const char *
	getDMDFile();

	std::string
	getDPDFile();

	const char *
	getFileRefId();

	const char *
	getInstantiationId();

	const char *
	getUsageName();

	bool
	isCompositePartOf();

	bool
	isDeployOn();

	bool
	isDomainManager();

  protected:
	void
	parseCompositePartOfDevice(
	    TiXmlElement * elem);

	void
	parseDeployOnDevice(
	    TiXmlElement * elem);

	void
	parseDPDFileName(
	    TiXmlElement * elem);

	void
	parseInstantiations(
	    TiXmlElement * elem);

  private:
	std::string m_instantiationId;
	std::string m_usageName;
	std::string m_compositePartOfDeviceID;
	std::string m_deployOnDeviceID;
	std::string m_dpdFile;
	bool m_ifCompositePartOf;
	/**
	 * No copying
	 */
	bool m_ifDeployOn;
	bool m_ifDomainManager;

	DCDComponentPlacement();

	DCDComponentPlacement(
	    const DCDComponentPlacement & dcdCP);
};

/**
 * class OPENSCA_PARSER_API DCDComponentInstantiation:public ComponentInstantiation
 */
class DCDComponentInstantiation :
	public ComponentInstantiation {
  public:
	DCDComponentInstantiation(
	    TiXmlElement * elem);

	virtual ~DCDComponentInstantiation();

  private:
	DCDComponentInstantiation();

	DCDComponentInstantiation(
	    const DCDComponentInstantiation & dcdCI);
};

/**
 * class OPENSCA_PARSER_API DCDInstantiationProperty
 */
class DCDInstantiationProperty {

  public:
	DCDInstantiationProperty(
	    const char * id,
	    const char * val);

	~DCDInstantiationProperty();

	const char *
	getID();

	const char *
	getValue();

	void
	setID(
	    char * id);

	void
	setValue(
	    char * value);

  private:
	std::string m_id;
	std::string m_value;

	DCDInstantiationProperty();

	DCDInstantiationProperty(
	    const DCDInstantiationProperty & dcdIP);
};

/**
 * class OPENSCA_PARSER_API ComponentFile
 */
class componentFile {

  public:
	componentFile();

	virtual ~componentFile();

	componentFile(
	    const char * id,
	    const char * fileName);

	const char *
	fileName();

	const char *
	id();

  private:
	std::string m_fileName;
	std::string m_id;

};

#endif // !defined(EA_F5F0DB21_243D_45f0_9EEF_B11945F9E4A9__INCLUDED_)