/***************************************************************************//**
* @file     Naming_main.cpp
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

#include <iostream>

#include "ace/OS_main.h"
#include "tao/debug.h"
#include "tao/ImR_Client/ImR_Client.h"
#include "orbsvcs/Shutdown_Utilities.h"

#include "../include/debug.h"
#include "../include/Naming_Service.h"
#include "utils.h"
#include "Boost_utils.h"

class Naming_Svc_Shutdown :
	public Shutdown_Functor {
  public:
	Naming_Svc_Shutdown(
	    TAO_Naming_Service & ns);

	void operator() (
	    int which_signal);
  private:
	TAO_Naming_Service & m_ns;
};

Naming_Svc_Shutdown::Naming_Svc_Shutdown(
    TAO_Naming_Service & ns)
	: m_ns(ns) {

}

void
Naming_Svc_Shutdown::operator()(
    int which_signal) {
	if (TAO_debug_level > 0)
		ACE_DEBUG(
		    (LM_DEBUG, "Name Service: shutting down on signal %d\n", which_signal));
	(void) m_ns.shutdown();
}

// Driver function for the TAO Naming Service.
#ifdef __SDS_OS_VXWORKS__
extern "C"
int Naming_Service_Main(int argc , char** argv)
#elif defined (__SDS_OS_LINUX__)
int main(int argc, char *argv[])
#endif
{
	DEBUG(1, Naming_server, "entry into Naming server...")

	ACE_TCHAR** nameServiceArgv = new char * [argc + 1];

	nameServiceArgv[0] = new char[strlen("nameservice_orb")];
	strcpy(nameServiceArgv[0], "nameservice_orb");

	for (int i = 0; i < argc - TASK_PARAMS_COUNT;
	        i++) { ///< taskParams's three params are not used.
		nameServiceArgv[i + 1] = new char[strlen(argv[i])];
		strcpy(nameServiceArgv[i + 1], argv[i]);
	}

	TAO_Naming_Service namingService;

	// Stuff to insure that we're gracefully shut down...
	Naming_Svc_Shutdown killer(namingService);
	Service_Shutdown kill_contractor(killer);
	DEBUG(7, Naming_server, "argc is " << argc)

	if (namingService.init(argc + 1 - TASK_PARAMS_COUNT, nameServiceArgv) == -1)
		ACE_ERROR_RETURN(
		    (LM_ERROR, ACE_TEXT("Failed to start the Naming Service.\n")), 1);
	try {
		DEBUG(2, naming_main, "Naming service begin to run...")
#ifdef __SDS_OS_VXWORKS__
		semGive(domainMgrMtx);
#elif defined __SDS_OS_LINUX__
		postSemaphore(BOOST_CONSTANT::DOMAIN_MANAGER_CND);
#endif

		namingService.run();

	} catch (const CORBA::Exception& ex) {

		ex._tao_print_exception("NamingService");
		for (int i = 0; i < argc; i++) {
			delete[] argv[i];
			argv[i] = NULL;
		}
		delete[] argv;
		argv = NULL;

		return 1;

	}

	namingService.fini();
	for (int i = 0; i < argc; i++) {
		delete[] argv[i];
		argv[i] = NULL;
	}
	delete[] argv;
	argv = NULL;

	return 0;
}
