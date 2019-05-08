/***************************************************************************//**
* @file     SCDParser.h
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

#if !defined(EA_D210E48D_0FC6_4db0_8BCD_9AC55B4F1F78__INCLUDED_)
#define EA_D210E48D_0FC6_4db0_8BCD_9AC55B4F1F78__INCLUDED_

#include "tinyxml.h"

#include "CFS.h"

class SCDParser {

  public:
	SCDParser(
	    CF::File_ptr file);
	~SCDParser();

	const char *
	getComponentType();

	const char *
	getPRFFile();

	bool
	isApplication();

	bool
	isConfigurable();

	bool
	isDevice();

	bool
	isDeviceManager();

	bool
	isDomainManager();

	bool
	isResource();

	bool
	isService();

  protected:
	void
	parseComponentType(
	    TiXmlElement * elem);

	void
	parseFile(
	    TiXmlElement * elem);

	void
	parsePRFRef(
	    TiXmlElement * elem);

  private:
	std::string m_componentType;
	std::string m_prfFile;

	/**
	 * No copying
	 */
	TiXmlDocument m_xmlDoc;

	SCDParser();
	/**
	 * No default Constructor
	 */
	SCDParser(
	    SCDParser & scd);
};

#endif // !defined(EA_D210E48D_0FC6_4db0_8BCD_9AC55B4F1F78__INCLUDED_)