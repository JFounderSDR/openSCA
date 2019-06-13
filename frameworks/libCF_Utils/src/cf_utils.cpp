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
    CF::File_var & file) {

	RTE_DEBUG(7, openProfileFile, "entering openProfileFile")

	if (CORBA::is_nil (fs)) {
		RTE_DEBUG(5, openProfileFile, " fs is nil")
		return false;
	}

	RTE_DEBUG(5, openProfileFile, "get filesys ref.")
	if (!fs->exists(profile)) {
		RTE_DEBUG(5, openProfileFile, "do not exist in file system." << profile)
		return false;
	}

	try {
		RTE_DEBUG(7, openProfileFile, profile)
		file = fs->open(profile, true);
	} catch (CF::InvalidFileName & e) {
		RTE_DEBUG(5, openProfileFile,
		      "when opening" <<
		      profile << "with invalid name")
		CF::InvalidFileName invalidFileName;
		invalidFileName.errorNumber = CF::CFEINVAL;
		invalidFileName.msg = CORBA::string_dup(profile);
		return false;
	} catch (CF::FileException & e) {
		RTE_DEBUG(5, openProfileFile,
		      "when opening " << profile << "File exception occur")
		return false;
	} catch (...) {
		RTE_DEBUG(5, openProfileFile, "when opening " <<
			profile << "Unkown exception occur")
		CF::FileException fileExc;
		fileExc.errorNumber = CF::CFENXIO;
		fileExc.msg = "open file failed with unkown exception";
		return false;
	}

	RTE_DEBUG(7, openProfileFile, "leaving openProfileFile")
	return true;
}

/**
 * @brief  The operation shall open a file, and return the
 *         file object reference.
 *
 * @note        shall close this CF::File object after use
 * @param[in]   fm          File Manager ojbect reference
 * @param[in]   profile     The file wait for opening
 * @param[in]   file        Reference of specialed file
 *
 * @return  Result of opening the file.
 * @retval  true    Open successfully.
 * @retval  false   Open failed.
 */
bool
openProfileFile(
    CF::FileManager_ptr fm,
    const char * profile,
    CF::File_var & file)
{
RTE_DEBUG(7, openProfileFile, "entering openProfileFile")

	if (CORBA::is_nil (fm)) {
		RTE_DEBUG(5, openProfileFile, " fm is nil")
		return false;
	}

	RTE_DEBUG(5, openProfileFile, "get filesys ref.")
	if (!fm->exists(profile)) {
		RTE_DEBUG(5, openProfileFile, "do not exist in file system." << profile)
		return false;
	}

	try {
		RTE_DEBUG(7, openProfileFile, profile)
		file = fm->open(profile, true);
	} catch (CF::InvalidFileName & e) {
		RTE_DEBUG(5, openProfileFile,
		      "when opening" <<
		      profile << "with invalid name")
		CF::InvalidFileName invalidFileName;
		invalidFileName.errorNumber = CF::CFEINVAL;
		invalidFileName.msg = CORBA::string_dup(profile);
		return false;
	} catch (CF::FileException & e) {
		RTE_DEBUG(5, openProfileFile,
		      "when opening " << profile << "File exception occur")
		return false;
	} catch (...) {
		RTE_DEBUG(5, openProfileFile, "when opening " << profile << "Unkown exception occur")
		CF::FileException fileExc;
		fileExc.errorNumber = CF::CFENXIO;
		fileExc.msg = "open file failed with unkown exception";
		return false;
	}

	RTE_DEBUG(7, openProfileFile, "leaving openProfileFile")
	return true;	
}

bool
closeProfileFile(
    CF::File_ptr file) {
	
	bool isclose = false;

	if (CORBA::is_nil(file) || file->_non_existent()) {
		RTE_DEBUG(2, DeviceManager,
			"[DeviceManager_impl::closeProfileFile] file is not exist.")
	}

	try {
		file->close();
	} catch (CF::FileException & e) {
		RTE_DEBUG(2, DeviceManager, "[DeviceManager_impl::closeProfileFile]close\
		      file with FileException:" << e.msg)
		isclose = false;
	} catch (...) {
		RTE_DEBUG(2, DeviceManager,"[DeviceManager_impl::instantDCDComps]close\
		      file with unknown Exception:")
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
	RTE_DEBUG(4, openscaSupport, "Object Added Event - ProducerId: "\
		<< producerId << "  SourceId: " << sourceId << 
	    "  SourceName: " << sourceName)

	// Future implementation
#ifdef HAVE_ACEEVENTS
	StandardEvent::DomainManagementObjectAddedEventType event_data;
	CORBA::Any any;

	event_data.producerId = CORBA::string_dup(producerId);
	event_data.sourceId = CORBA::string_dup(sourceId);
	event_data.sourceName = CORBA::string_dup(sourceName);
	//  event_data.sourceIOR = sourceIOR;
	event_data.sourceCategory = sourceCategory;

	any <<= event_data;

	ODM_Channel_consumer->push(any);

#endif
}
