/***************************************************************************//**
* @file     ConfigParser.h
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

#ifndef _CONFIG_PARSER_H_
#define _CONFIG_PARSER_H_

#include <iostream>
#include <map>
#include <string>
#include <vector>
using namespace std;

class ConfigParser {
  private:
	std::map<std::string, std::string> m_fileInfos;
	const std::string filePath;
	
	/** 
	 *  @brief	Parser text file which contains app's id and name.Save app's id and 
	 *  name in map: key is id, value is name.
	 */
	void
	parserFile();

  public:
	ConfigParser(
	    const std::string & fileName);
	/**
	 *  @brief		Get app's name according to the app's id provided by user.
	 *
	 *  @param[in]	id		id which user wants to get relative value.
	 */
	const char *
	getValueById(
	    const char * inputId);
};

#endif //_CONFIG_PARSER_H_