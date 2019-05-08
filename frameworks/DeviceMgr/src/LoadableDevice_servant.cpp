/***************************************************************************//**
* @file     LoadableDevice_servant.cpp
* @author   open Team
* @version  9
* @date     2017-03-12
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

#ifdef __SDS_OS_VXWORKS__
#include <loadLib.h>
#include <usrLib.h>
#endif

#include "../include/LoadableDevice_servant.h"
#include "utils.h"

LoadableDevice_servant::LoadableDevice_servant() {

}

LoadableDevice_servant::LoadableDevice_servant(
    char * id,
    char * lbl,
    char * sftwfrl) :
	Device_servant (id, lbl, sftwfrl) {

}

LoadableDevice_servant::~LoadableDevice_servant() {

}

void
LoadableDevice_servant::configure(
    const CF::Properties & configProperties)
throw (
    CF::PropertySet::PartialConfiguration,
    CF::PropertySet::InvalidConfiguration,
    CORBA::SystemException) {

}

/**
 * @brief	The load operation provides the mechanism for loading software on a
 *        	specific device.
 *
 *	      	The loaded software may be subsequently executed on the device, if
 *	      	the device is an executable device.
 *
 *  		The load operation shall load the file identified by the input
 *  		filename parameter on the device based upon the input loadKind
 *  		parameter. The input filename parameter is a pathname relative to
 *  		the file system identified by the input FileSystem parameter
 *
 *  		The load operation shall support the load types as stated in the
 *  		device's software profile LoadType allocation properties.
 *
 *  		Multiple loads of the same file as indicated by the input fileName
 *  		parameter shall not result in an exception. However, the load
 *  		operation should account for this multiple load so that the
 *  		unload operation behavior can be performed.
 *
 * @param[in]	fs			fileSystem  in where the file need loaded is.
 * @param[in]	fileName 	name of the file need loaded.
 * @param[in]	loadKind	type of load to be performed
 *
 * @exception	The load operation shall raise the InvalidState exception if upon
 *            	entry the Device's adminState
 * 				attribute is either LOCKED or SHUTTING_DOWN or its operationalState
 * 				attribute is DISABLED.
 *
 *			   	The load operation shall raise the InvalidLoadKind exception when
 *			   	the input loadKind parameter is not supported.
 *
 *			   	The load operation shall raise the CF InvalidFileName exception
 *			   	when the file designated by the input filename parameter cannot
 *			   	be found.
 *
 *			   	The load operation shall raise the LoadFail exception when an
 *			   	attempt to load the device is unsuccessful.
 */
void
LoadableDevice_servant::load(
    CF::FileSystem_ptr fs,
    const char * fileName,
    CF::LoadableDevice::LoadType loadKind)
throw (
    CF::LoadableDevice::LoadFail,
    CF::InvalidFileName,
    CF::LoadableDevice::InvalidLoadKind,
    CF::Device::InvalidState,
    CORBA::SystemException) {
	DEBUG(5, LoadableDevice_servant, "In load with fileName is: " << fileName)

	if (CORBA::is_nil(fs)) {
		DEBUG(5, DevMgr, "load() input parameter:fs is invalid")
		return;
	}

	if (fileName == NULL) {
		DEBUG(5, DevMgr, "load() input parameter:fileName is null")
		throw CF::InvalidFileName();
	}

	if (m_adminState == CF::Device::LOCKED) {
		DEBUG(5, DevMgr, "Device admini state is locked: " << m_adminState)
		throw CF::Device::InvalidState();
	}

	if (m_operationalState == CF::Device::DISABLED) {
		DEBUG(5, DevMgr,
		      "device operational state is disabled" << m_operationalState)
		throw CF::Device::InvalidState();
	}

	if (!fs->exists(fileName)) {
		DEBUG(5, DevMgr,
		      "[LoadableDevice_servant::load]: " << fileName << " don't exist.")
		return;
	}
}

/**
 * @brief	The unload operation provides the mechanism to unload software that
 *        	is currently loaded.
 *
 * 			The unload operation shall unload the file identified by the input
 * 			fileName parameter from the device when the number of unload requests
 * 			matches the number of load requests for the indicated file.
 *
 * @param[in]	fileName	name of file need to be unloaded.
 *
 * @exception	The unload operation shall raise the InvalidState exception if
 *            	upon entry the device's adminState attribute is LOCKED or its
 *            	operationalState attribute is DISABLED.
 *
 *			  	The unload operation shall raise the CF InvalidFileName exception
 *			  	when the file designated by the input filename parameter cannot
 *			  	be found.
 */
void
LoadableDevice_servant::unload(
    const char * fileName)
throw (
    CF::InvalidFileName,
    CF::Device::InvalidState,
    CORBA::SystemException) {

}
