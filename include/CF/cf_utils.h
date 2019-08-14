/***************************************************************************//**
* @file     cf_utils.h
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

#if !defined __CF_UTILS_H_
#define __CF_UTILS_H_

#include <string.h>
#include <vector>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <unistd.h>

#include "macros.h"
#include "ConfigParser.h"
#include "TimeDelay.h"
#include "debug.h"
#include "CFS.h"
#include "StandardEventC.h"
#include "Boost_utils.h"

void 
printCORBASystemException(
	const CORBA::SystemException & e);

void
printCORBAException(
	const CORBA::Exception & e);

/**
 * @brief  The operation shall open a file, and return the
 *         file object reference.
 *
 * @note        shall close this CF::File object after use
 * @param[in]   fs          File system ojbect reference
 * @param[in]   profile     The file wait for opening
 * @param[in]   file        Reference of specialed file
 *
 * @return  Result of opening the file.
 * @retval  true    Open successfully.
 * @retval  false   Open failed.
 */
bool
openProfileFile(
    CF::FileSystem_ptr fs,
    const char * profile,
    CF::File_var & file);

bool
closeProfileFile(
    CF::File_ptr file);

void
sendObjAdded_event(
    const char * producerId,
    const char * sourceId,
    const char * sourceName,
    CORBA::Object_ptr sourceIOR,
    StandardEvent::SourceCategoryType sourceCategory);


std::string
getConfigFilePathByExecutablePath();

#endif //_LIBCF_UTILS_H_
