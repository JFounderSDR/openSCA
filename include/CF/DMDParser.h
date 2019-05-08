/***************************************************************************//**
* @file     DMDParser.h
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

#if !defined(EA_1009C4F2_7364_4137_97F8_A8F1CAAFFBA3__INCLUDED_)
#define EA_1009C4F2_7364_4137_97F8_A8F1CAAFFBA3__INCLUDED_

#include "tinyxml.h"

#include "CFS.h"

/**
 * class OPENSCA_PARSER_API DMDParser
 */
class DMDParser {

  public:
	DMDParser(
	    CF::File_ptr file);

	DMDParser(
	    std::string fileName);

	~DMDParser();

	const char *
	getDomainManagerSoftPkg();

	const char *
	getID();

	const char *
	getName();

	const char *
	toString();


  protected:
	void
	parseDomainManagerSoftPkg(
	    TiXmlElement * elem);

	void
	parseFile(
	    TiXmlElement * elem);

  private:
	std::string m_dmdId;
	std::string m_dmdName;
	std::string m_domainManagerSoftPkg;
	/**
	 * Don't allow copying
	 */
	TiXmlDocument m_xmlDoc;

	DMDParser();

	DMDParser(
	    const DMDParser & _dmdP);
};
#endif // !defined(EA_1009C4F2_7364_4137_97F8_A8F1CAAFFBA3__INCLUDED_)