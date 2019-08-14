/***************************************************************************//**
* @file     cf_utils.cpp
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

#include "../include/cf_utils.h"

#include <assert.h>
#include <stdio.h>

#ifdef __SDS_OS_LINUX__
#include <sys/types.h>
#include <sys/ipc.h>
#include <sys/msg.h>
#include <time.h>
#include <stdlib.h>
#include <stdio.h>  
#include <unistd.h> 
#elif defined __SDS_OS_VXWORKS__
#include <msgQLib.h>
#include <SemLib.h>
#endif

#include <cstring>
#include <iostream>

void 
printCORBASystemException(
	const CORBA::SystemException & e)
{
	DEBUG(0, [cf_utils::printCORBASystemException],
		"CORBA::SystemException e.completed:" << e.completed())
	DEBUG(0, [cf_utils::printCORBASystemException],
		"CORBA::SystemException e.minor:" << e.minor())
	DEBUG(0, [cf_utils::printCORBASystemException],
		"CORBA::SystemException e._info:" << e._info())
	DEBUG(0, [cf_utils::printCORBASystemException],
		"CORBA::SystemException e._name:" << e._name())
	DEBUG(0, [cf_utils::printCORBASystemException],
		"CORBA::SystemException e._rep_id:" << e._rep_id())
}

void
printCORBAException(
	const CORBA::Exception & e)
{
	DEBUG(0, [cf_utils::printCORBAException],
		"CORBA::Exception e.id:" << e._rep_id())
	DEBUG(0, [cf_utils::printCORBAException],
		"CORBA::Exception e.name:" << e._name())
	DEBUG(0, [cf_utils::printCORBAException],
		"CORBA::Exception e.info:" << e._info().c_str())
}

/**
 * @brief  The operation shall open a file, and return the
 *         file object reference.
 *
 * @note	  	shall close this CF::File object after use
 * @param[in]	fs 			File system ojbect reference
 * @param[in]	profile		The file wait for opening
 * @param[in]	file 		Reference of specialed file
 *
 * @return	Result of opening the file.
 * @retval	true	Open successfully.
 * @retval	false	Open failed.
 */
bool
openProfileFile(
    CF::FileSystem_ptr fs,
    const char * profile,
    CF::File_var & file) 
{

	DEBUG(7, [cf_utils::openProfileFile], "entering...")

	if (CORBA::is_nil (fs)) {
		DEBUG(0, [cf_utils::openProfileFile], " fs is nil")
		return false;
	}

	DEBUG(5, [cf_utils::openProfileFile], "get filesys ref.")
	if (!fs->exists(profile)) {
		DEBUG(0, [cf_utils::openProfileFile], 
			"do not exist in file system." << profile)
		return false;
	}

	try {
		DEBUG(7, [cf_utils::openProfileFile], profile)
		file = fs->open(profile, true);
	} catch (CF::InvalidFileName & e) {
		DEBUG(0, [cf_utils::openProfileFile],
		    "when opening" << profile << "with invalid name")
		CF::InvalidFileName invalidFileName;
		invalidFileName.errorNumber = CF::CFEINVAL;
		invalidFileName.msg = CORBA::string_dup(profile);
		return false;
	} catch (CF::FileException & e) {
		DEBUG(0, [cf_utils::openProfileFile],
		      "when opening " << profile << "File exception occur")
		return false;
	} catch (...) {
		DEBUG(0, [cf_utils::openProfileFile], "when opening " <<
			profile << "Unkown exception occur")
		CF::FileException fileExc;
		fileExc.errorNumber = CF::CFENXIO;
		fileExc.msg = "open file failed with unkown exception";
		return false;
	}

	DEBUG(7, [cf_utils::openProfileFile], "leaving...")
	return true;
}

bool
closeProfileFile(
    CF::File_ptr file) {
	
	bool isclose = false;

	if (CORBA::is_nil(file) || file->_non_existent()) {
		DEBUG(0, [cf_utils::closeProfileFile],
			"file is not exist.")
	}

	try {
		file->close();
	} catch (CF::FileException & e) {
		DEBUG(0, [cf_utils::closeProfileFile], 
			"close file with FileException:" << e.msg)
		isclose = false;
	} catch (...) {
		DEBUG(0, [cf_utils::closeProfileFile],
			"close file with unknown Exception:")
		isclose = false;
	}
	isclose = true;

	return isclose;
}

void
sendObjAdded_event(
    const char * producerId,
    const char * sourceId,
    const char * sourceName,
    CORBA::Object_ptr sourceIOR,
    StandardEvent::SourceCategoryType sourceCategory)

{
	DEBUG(4, [cf_utils::sendObjAdded_event], 
		"Object Added Event - ProducerId: " << producerId << 
		"  SourceId: " << sourceId << "  SourceName: " << sourceName)

	// Future implementation
#ifdef HAVE_ACEEVENTS
	StandardEvent::DomainManagementObjectAddedEventType event_data;
	CORBA::Any any;

	event_data.producerId = CORBA::string_dup(producerId);
	event_data.sourceId = CORBA::string_dup(sourceId);
	event_data.sourceName = CORBA::string_dup(sourceName);
	event_data.sourceCategory = sourceCategory;

	any <<= event_data;

	ODM_Channel_consumer->push(any);

#endif
}

std::string
getConfigFilePathByExecutablePath()
{
  	int count = 1024;
  	char buf[count] = {};

    int i;
    int rslt = readlink("/proc/self/exe", buf, count - 1);
    if (rslt < 0 || (rslt >= count - 1)) {
        return NULL;
    }
    buf[rslt] = '\0';
    for (i = rslt; i >= 0; i--) {
        if (buf[i] == '/') {
            buf[i + 1] = '\0';
            break;
        }
    }
    std::string path = buf;
    size_t pos = path.find_last_of("/");
    path = path.substr(0, pos);
    DEBUG(3, [cf_utils::getConfigFilePathByExecutablePath],
        " path:" << path)
    pos = path.find_last_of("/");
    path = path.substr(0, pos + 1);
    path = path + "opensca.conf";
    DEBUG(3, [cf_utils::getConfigFilePathByExecutablePath],
      " path:" << path)
    return path;
}
