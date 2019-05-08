/***************************************************************************//**
* @file     LoadableDevice_servant.h
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
#if !defined(EA_00212301_1864_43d2_9F7C_0859F454BBD0__INCLUDED_)
#define EA_00212301_1864_43d2_9F7C_0859F454BBD0__INCLUDED_

#include <map>

#include "Device_servant.h"


struct FileInfo {
#ifdef __SDS_OS_VXWORKS__
	std::string localFile;
	CF::LoadableDevice::LoadType type;
	unsigned int refcnt;
	MODULE_ID moduleID;
#endif
};

typedef std::map<std::string, FileInfo> FileMap;

/**
 * This interface extends the Device interface by adding software 
 * loading and unloading behavior to a device.
 */
class LoadableDevice_servant :		
public virtual Device_servant,
public virtual POA_CF::LoadableDevice 
{

public:
	LoadableDevice_servant();

	/**
	 * @brief	Constructor of the LoadableDevice_servant.
	 * @param[in] id	 Identifier of the device.
	 * @param[in] lbl	 Label of the device.
	 * @param[in] sftwfl Device's spd.xml file path.
	 */
	LoadableDevice_servant(
		char * id,
		char * lbl,
		char * sftwfrl);

	~LoadableDevice_servant();

	/**
	 * @brief The configure operation allows id/value pair configuration properties 
	 *        to be assigned to components implementing this interface.
	 *
	 * The configure operation shall assign values to the properties as indicated 
	 * in the input configProperties parameter. Valid properties for the configure 
	 * operation shall at a minimum be the configure readwrite and writeonly 
	 * properties referenced in the component’s SPD.
	 *
	 * @param[in] configProperties	Properties need configured.
	 * @exception The configure operation shall raise a PartialConfiguration exception 
	 *            when some configuration properties were successfully set and some 
	 *            configuration properties were not successfully set.
	 *            
	 *            The configure operation shall raise an InvalidConfiguration 
	 *            exception when a configuration error occurs and no configuration 
	 *            properties were successfully set.
	 */
	void
	configure(
	    const CF::Properties & configProperties)
	throw (
	    CF::PropertySet::PartialConfiguration,
	    CF::PropertySet::InvalidConfiguration,
	    CORBA::SystemException);

	/**
	 * @brief The load operation provides the mechanism for loading software on 
	 * a specific device. The loaded software may be subsequently executed on 
	 * the device, if the device is an executable device.
	 *
	 * The load operation shall load the file identified by the input filename 
	 * parameter on the device based upon the input loadKind parameter. 
	 * The input filename parameter is a pathname relative to the file system 
	 * identified by the input FileSystem parameter.
	 * 
	 * The load operation shall support the load types as stated in the device’s 
	 * software profile LoadType allocation properties.
	 * 
	 * Multiple loads of the same file as indicated by the input fileName parameter 
	 * shall not result in an exception. However, the load operation should account 
	 * for this multiple load so that the unload operation behavior can be performed.
	 *
	 * @param[in] fs		File system of the platform.
	 * @param[in] fileName	Name of the code file need loaded.
	 * @param[in] loadKind	Type of load to be performed.
	 *
	 * @exception The load operation shall raise the InvalidState exception if upon 
	 *            entry the Device's adminState attribute is either LOCKED or 
	 *            SHUTTING_DOWN or its operationalState attribute is DISABLED.
	 *            The load operation shall raise the InvalidLoadKind exception when 
	 *            the input loadKind parameter is not supported.
	 *            
	 *            The load operation shall raise the CF InvalidFileName exception 
	 *            when the file designated by the input filename parameter cannot 
	 *            be found.
	 *            
	 *            The load operation shall raise the LoadFail exception when an 
	 *            attempt to load the device is unsuccessful.
	 */
	void
	load(
	    CF::FileSystem_ptr fs,
	    const char * fileName,
	    CF::LoadableDevice::LoadType loadKind)
	throw (
	    CF::LoadableDevice::LoadFail,
	    CF::InvalidFileName,
	    CF::LoadableDevice::InvalidLoadKind,
	    CF::Device::InvalidState,
	    CORBA::SystemException);

	/**
	 * @brief	The unload operation provides the mechanism to unload software that 
	 *        	is currently loaded.
	 *         
	 *         	The unload operation shall unload the file identified by the input 
	 *         	fileName parameter from the device when the number of unload requests 
	 *         	matches the number of load requests for the indicated file.
	 *
	 * @param[in] fileName	Name of the file need unloaded.
	 *
	 * @exception The unload operation shall raise the InvalidState exception if 
	 *            upon entry the device's adminState attribute is LOCKED or its 
	 *            operationalState attribute is DISABLED.
	 *            The unload operation shall raise the CF InvalidFileName exception 
	 *            when the file designated by the input filename parameter cannot 
	 *            be found.
	 */
	void
	unload(
	    const char * fileName)
	throw (
	    CF::InvalidFileName,
	    CF::Device::InvalidState,
	    CORBA::SystemException);

protected:
	FileMap m_fmap;

private:
	LoadableDevice_servant(LoadableDevice_servant& prm1);

};
#endif // !defined(EA_00212301_1864_43d2_9F7C_0859F454BBD0__INCLUDED_)