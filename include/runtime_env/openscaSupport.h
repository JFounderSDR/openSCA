/***************************************************************************//**
* @file     openscaSupport.h
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

#if !defined(EA_97977A88_A4D8_4aad_AC39_6C72AF2546A9__INCLUDED_)
#define EA_97977A88_A4D8_4aad_AC39_6C72AF2546A9__INCLUDED_

#include <iostream>
#include <string>
#include <vector>

#include "orbsvcs/orbsvcs/CosNamingC.h"
#include "tao/PortableServer/PortableServer.h"

#include "ConfigParser.h"
#include "Boost_utils.h"
#include "rte_debug.h"

namespace openscaSupport {

/**
 * @brief The ORB class wrap basic option for orb such as
 *        orb_init/get_POA/get_NamingContext/bind/unbind and so on.  
 *        addtionally, the class provides access to orb, poa, namingContext 
 *        object.
 */
class ORB_Wrap {
  public:
	/**
	 * it's static variable, provides access to naming context for 
	 * multiple classes.
	 */
	static CosNaming::NamingContext_var naming_cntx;

	/**
	 * it's static variable, provides access to orb for multiple classes.
	 */
	static CORBA::ORB_var orb;

	/**
	 * it's static variable, provides access to poa manager 
	 * for multiple classes.
	 */
	static PortableServer::POAManager_var pman;

	/**
	 * it's static variable, provides access to poa for multiple classes.
	 */
	static PortableServer::POA_var poa;

	ORB_Wrap();

	ORB_Wrap(
	    int argc,
	    char * argv[]);

	~ORB_Wrap();

	/**
	 * @brief	The operation shall bind object to string 
	 *        	in specified naming context.
	 * @param[in] obj	Object needs bound.
	 * @param[in] nc	On which naming context the object binds.
	 * @param[in] name	Name of the object context.
	 */
	void
	bind_object_to_string(
	    CORBA::Object_ptr obj,
	    const CosNaming::NamingContext_ptr nc,
	    const char * name);

	/**
	 * @brief	The operation shall bind object to string 
	 *        	in specified naming context.
	 * @param[in] obj	Object needs bound.
	 * @param[in] name	Name of the object context.
	 */
	bool
	bind_object_to_string(
	    CORBA::Object_ptr obj,
	    const char * name);

	/**
	 * @brief The operation shall return object ref by string from 
	 *        specified naming context.
	 *
	 * @param[in] nc	Naming context on which the object bind.
	 * @param[in] name	Name of the object context.
	 *
	 * @return Object reference bound with specific name. 
	 */
	CORBA::Object_ptr
	get_object_from_string(
	    const CosNaming::NamingContext_ptr nc,
	    const char * name);

	/**
	 * @brief The operation shall return object ref by string from 
	 *        specified naming context.
	 *
	 * @param[in] name	Name of the object context.
	 *
	 * @return Object reference bound with specific name. 
	 */
	CORBA::Object_ptr
	get_object_from_string(
	    const char * name);

	/**
	 * @brief The operation shall convert string to CosNaming::Name.
	 */
	CosNaming::Name_var
	string_to_CosName(
	    const char * name);

	/**
	 * @brief unbind name(convert string) from specified naming context
	 */
	void
	unbind_string(
	    const CosNaming::NamingContext_ptr nc,
	    const char * name);

	/**
	 * @brief unbind name(convert string) from naming context
	 */
	void
	unbind_string(
	    const char * name);

	/**
	 * @brief	The operation shall bind the name to naming service,
	 *        	when a new object created, if the object wants to bind on
	 *        	the naming service, then shall call this operation.
	 */
	bool
	bind_new_context_with_string(
	    const char * name);

	/**
	 * destory NamingContext nc
	 */
	void
	destory_context(
	    const CosNaming::NamingContext_ptr nc);

	/**
	 * @brief convert object reference to ior
	 * 
	 * @note this routine myebe throw exception from internal interface, 
	 *       so calling function should try/catch unkonwn exception
	 * @param[in] obj	object reference
	 * @retval a string of ior 
	 */
	const char *
	object_to_ior(
	    CORBA::Object_ptr obj);

	/**
	 * @brief convert ior to object
	 * 
	 * @note this routine maybe throw exception from internal interface, 
	 *       so calling function should try/catch unkonwn exception
	 * @param[in] ior	IOR of a object
	 * @retval the object reference
	 */
	CORBA::Object_ptr 
	ior_to_object(
	    const char * ior);

  private:

	/**
	 * @brief Count the number of the orb_wrap class instances. 
	 *        When ref_cnt is equal to zero, then destroy orb.
	 */
	static unsigned int ref_cnt;
	std::string m_namingServiceIor;

	const char *
	checkConfigInfo(
	    ConfigParser * configParser,
	    const char * item);

	void
	getNamingServiceIor();

	/**
	 * resolve reference to POA, and activate poa manager.resolve reference to
	 * NamingContext
	 */
	void
	init();
};

/**
 * @brief check if filename is valid,Valid individual filenames and directory 
 *        names shall be 40 characters or less. Valid characters for a 
 *        filename or directory name are the 62 alphanumeric characters 
 *        (Upper, and lowercase letters and the numbers 0 to 9) in addition 
 *        to the '.' (period), '_'(underscore) and '-'(hyphen) characters. 
 *        The filenames '.'("dot") and '..' ("dot-dot") are invalid in the 
 *        context of a file system. Valid pathnames are structured according 
 *        to the POSIX specification whose valid characters include the 
 *        '/'(forward slash) character in addition to the valid filename 
 *        characters. A valid pathname may consist of a single filename. A 
 *        valid pathname shall not exceed 1024 characters.
 */
bool
isValidFileName(
    const char * fileName);

/**
 * @brief this routine create a persistent POA as the child of ROOT POA, 
 *        ROOT POA and child POA is in control of ROOT Manager. This child 
 *        POA have USER_ID and PERSISTENT policy.
 */
PortableServer::POA_ptr
createPersistentPOA(
    PortableServer::POA_ptr root_poa,
    const char * poa_name);

/**
 * @brief The operation shall write object reference ior into specfic file.
 * @brief ior	Ior of object needs write into a file.
 * @fileName 	Name of the file into which the ior will be written.
 */
void
writeIORFile(
    const char * ior,
    const char * fileName);
}

#endif // !defined(EA_97977A88_A4D8_4aad_AC39_6C72AF2546A9__INCLUDED_)
