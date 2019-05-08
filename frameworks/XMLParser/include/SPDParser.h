/***************************************************************************//**
* @file     SPDParser.h
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

#if !defined(EA_18A09787_D510_4795_8C12_D7E4E971535C__INCLUDED_)
#define EA_18A09787_D510_4795_8C12_D7E4E971535C__INCLUDED_

#include <iostream>

#include "tinyxml.h"
#include "CFS.h"

#include "debug.h"
#include "PRFParser.h"
#include "parser_helpers.h"

class SPDImplementation;
class SPDAuthor;
class OSAttributes;

/**
 * @brief	This class is designed to parse all elements of SPD.xml. SPD.xml 
 *        	contains serveral key element, include title, propertRef, authors, 
 *        	description, and Implemention.
 */
class SPDParser {

  public:
	SPDParser();
	static char * SCA_COMPLIANT;
	static char * SCA_NON_COMPLIANT;

	SPDParser(
	    CF::File_ptr file);

	SPDParser(
	    std::string fileName);

	~SPDParser();

	std::vector <SPDAuthor*> *
	getAuthors();

	const char *
	getDescription();

	std::vector <SPDImplementation*> *
	getImplementations();

	const char *
	getPRFFile();

	const char *
	getSCDFile();

	const char *
	getSoftPkgID();

	const char *
	getSoftPkgName();

	const char *
	getSoftPkgTitle();

	const char *
	getSoftPkgType();

	const char *
	getSoftPkgVersion();

	const char *
	getSPDFile();

	bool
	isScaCompliant();

	bool
	isScaNonCompliant();

  protected:
	std::vector <SPDAuthor*> m_authors;
	std::vector <SPDImplementation*> m_implementations;
	std::string m_prfFile;
	std::string m_scdFile;
	std::string m_softPkgDescription;
	std::string m_softPkgID;
	std::string m_softPkgName;
	std::string m_softPkgTitle;
	std::string m_softPkgType;
	std::string m_softPkgVersion;
	std::string m_spdFile;

	char *
	getTextNode(
	    TiXmlElement * elem);

	void
	parseFile(
	    TiXmlElement * elem);

	void
	parseImplementations(
	    TiXmlElement * elem);

	void
	parsePRFRef(
	    TiXmlElement * elem);

	void
	parseSCDRef(
	    TiXmlElement * elem);

	void
	parseSoftPkgAttributes(
	    TiXmlElement * elem);

	void
	parseSoftPkgAuthor(
	    TiXmlElement * elem);

	void
	parseSoftPkgDescription(
	    TiXmlElement * elem);

	void
	parseSoftPkgTitle(
	    TiXmlElement * elem);

  private:
	/**
	 * No copying
	 */
	TiXmlDocument XMLDoc;
	std::string m_fileName;

	SPDParser(
	    const SPDParser & _spdParser);
};

class OSAttributes {

  public:
	OSAttributes();

	~OSAttributes();

	const char *
	getOSName() {
		return  m_osName.c_str();
	}

	const char *
	getOSVersion() {
		return  m_osVersion.c_str();
	}

	void
	setOSName(
	    const char * _name) {
		m_osName = _name;
	}

	void
	setOSVersion(
	    const char * _version) {
		m_osVersion = _version;
	}

  private:
	std::string m_osName;
	std::string m_osVersion;

};

/**
 * @brief	This class is designed to parse Implementation element of SPD.xml.
 *        	Implementation consist of some relative child element such as 
 *        	processor, compliler, prf and so on.
 */
class SPDImplementation {

  public:
	SPDImplementation(
	    TiXmlElement * elem);

	~SPDImplementation();

	const char *
	getCodeFile();

	CF::LoadableDevice::LoadType
	getCodeType() const;

	const char *
	getCompilerName();

	const char *
	getCompilerVersion();

	const char *
	getEntryPoint();

	unsigned long
	getStackSize();

	unsigned long
	getPriority();

	const char *
	getID();

	OSAttributes
	getOperatingSystem();

	PropertyFile *
	getPRFFile();

	std::vector<std::string>
	getProcessors() const;

	void
	setCodeType(
	    const char * _ct);

  protected:
	void
	parseCode(
	    TiXmlElement * elem);

	void
	parseCompiler(
	    TiXmlElement * elem);

	void
	parseElement(
	    TiXmlElement * elem);

	void
	parseID(
	    TiXmlElement * elem);

	void
	parseOperatingSystems(
	    TiXmlElement * elem);

	void
	parsePRFRef(
	    TiXmlElement * elem);

	void
	parseProcessors(
	    TiXmlElement * elem);

  private:
	std::string m_codeFile;
	CF::LoadableDevice::LoadType m_codeType;
	std::string m_compilerName;
	std::string m_compilerVersion;
	std::string m_entryPoint;
	std::string m_implementationID;
	OSAttributes m_os;
	PropertyFile * m_prfFile;
	std::string m_priority;
	std::vector < std::string > m_processorsName;
	/**
	 * No copying
	 */
	CF::Properties m_propDep;
	std::string m_stackSize;

	SPDImplementation();

	SPDImplementation(
	    const SPDImplementation & _spdi);
};

/**
 * this class is designed to parse SPD Author element, and save Author Infomation
 * such as company, name, webpage.
 */
class SPDAuthor {

  public:
	SPDAuthor(
	    TiXmlElement * elem);

	~SPDAuthor();

	const char *
	getAuthorCompany();

	const char *
	getAuthorName();

	const char *
	getAuthorWebPage();

	void
	parseElement(
	    TiXmlElement * elem);

  protected:
	void
	parseSoftPkgAuthor(
	    TiXmlElement * elem);

  private:
	std::string m_authorCompany;
	std::string m_authorName;
	std::string m_authorWebPage;

	SPDAuthor();

	SPDAuthor(
	    const SPDAuthor & _spda);
};


#endif // !defined(EA_18A09787_D510_4795_8C12_D7E4E971535C__INCLUDED_)