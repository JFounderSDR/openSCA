/***************************************************************************//**
* @file     Naming_Service.cpp
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

#include "orbsvcs/Daemon_Utilities.h"
#include "ace/Get_Opt.h"
#include "ace/Argv_Type_Converter.h"
#include "ace/Task.h"
#include "tao/Messaging/Messaging.h"
#include "orbsvcs/CosEvent/CEC_Default_Factory.h"

#include "../include/Naming_Service.h"
#include "../include/debug.h"

// Default Constructor.
TAO_Naming_Service::TAO_Naming_Service(void)
	: m_time(0), m_numThread(1) {

}

// Constructor taking command-line arguments.
TAO_Naming_Service::TAO_Naming_Service (
    int argc,
    ACE_TCHAR* argv[])
	: m_time(0), m_numThread(1) {
	DEBUG(7, TAO_Naming_Service::TAO_Naming_Service, "enter in...");
	this->init(argc, argv);
}

// Initialize the state of the TAO_Naming_Service object
int
TAO_Naming_Service::init (
    int argc,
    ACE_TCHAR * argv[]) {
	try {
		DEBUG(7, TAO_Naming_Service::init, " 0");

		//Check if -ORBDaemon is specified and if so, daemonize at this moment,
		//-ORBDaemon in the ORB core is faulty, see bugzilla 3335
		TAO_Daemon_Utility::check_for_daemon(argc, argv);
		TAO_CEC_Default_Factory::init_svcs();

		// Initialize the ORB
		this->m_orbVar = CORBA::ORB_init(argc, argv);

		// Set the policy value to 1 millisecond (10 * 1000 msec/usec).
		TimeBase::TimeT relative_rt_m_timeout = 5 * 1000 * 10000; // 5 seconds
		CORBA::Any relative_rt_m_timeout_as_any;
		relative_rt_m_timeout_as_any <<= relative_rt_m_timeout;

		// Create the policy and add it to a CORBA::PolicyList.
		CORBA::PolicyList policyList;
		policyList.length(1);
		policyList[0] = this->m_orbVar->create_policy(
		                    Messaging::RELATIVE_RT_TIMEOUT_POLICY_TYPE,
		                    relative_rt_m_timeout_as_any);

		// Apply the policy at the ORB level.
		CORBA::Object_var obj =
		    this->m_orbVar->resolve_initial_references("ORBPolicyManager");
		CORBA::PolicyManager_var policy_manager =
		    CORBA::PolicyManager::_narrow(obj.in());
		policy_manager->set_policy_overrides(policyList, CORBA::ADD_OVERRIDE);

		// Destroy the Policy objects.
		for (CORBA::ULong i = 0; i < policyList.length(); ++i) {
			policyList[i]->destroy();
		}
		policyList.length(0);

		DEBUG(7, TAO_Naming_Service::init, " 1");

		// Parse the args for '-t' option. If '-t' option is passed, do
		// the needful and then remove the option from the list of
		// arguments.
		this->parse_args(argc, argv);

		DEBUG(7, TAO_Naming_Service::init, " 2");
		// This function call initializes the naming service and returns
		// '-1' in case of an exception.
		int const result =
		    this->m_myNamingServer.init_with_orb(argc, argv, this->m_orbVar.in());

		if (result == -1)
			return result;
	} catch (const CORBA::Exception & ex) {
		ex._tao_print_exception("TAO_Naming_Service::init");
		return -1;
	}
	return 0;
}

int
TAO_Naming_Service::parse_args (
    int &argc,
    ACE_TCHAR * argv[]) {
	ACE_Get_Opt get_opts(argc, argv, ACE_TEXT("-t:n:"));
	int c;

	while ((c = get_opts()) != -1) {
		switch (c) {
		case 't': {
			int const m_time = ACE_OS::atoi(get_opts.opt_arg());
			if (m_time >= 0)
				this->m_time = m_time;

			// Remove the option '-t' from argv []
			// to avoid any confusion that might result.
			for (int i = get_opts.opt_ind(); i != argc; ++i)
				argv[i - 2] = argv[i];

			// Decrement the value of argc to reflect the removal
			// of '-t' option.
			argc = argc - 2;
			break;
		}
		case 'n': {
			int const nt = ACE_OS::atoi(get_opts.opt_arg());
			if (nt >= 1)
				this->m_numThread = nt;

			// Remove the option '-n' from argv []
			// to avoid any confusion that might result.
			for (int i = get_opts.opt_ind(); i != argc; ++i)
				argv[i - 2] = argv[i];

			// Decrement the value of argc to reflect the removal
			// of '-n' option.
			argc = argc - 2;
			break;
		}
		case '?':
		default:
			// Don't do anything. The TAO_Naming_Server::parse_args ()
			// takes care of indicating an error in case of error.
			break;
		}
	}
	return 0;
}

// Run the ORB event loop.
class ORB_Runner :
	public ACE_Task_Base {
  public:
	ORB_Runner(CORBA::ORB_ptr o, long t)
		: m_orbVar(CORBA::ORB::_duplicate(o)), m_time(t) {

	}

	int svc(void) {
		if (!CORBA::is_nil(m_orbVar.in())) {
			if (m_time == 0) {
				this->m_orbVar->run();
			} else {
				ACE_Time_Value tv(m_time);
				this->m_orbVar->run(tv);
			}
		}
		return 0;
	}

  private:
	CORBA::ORB_var m_orbVar;
	long m_time;
};

int
TAO_Naming_Service::run(
    void) {
	ORB_Runner runner(this->m_orbVar.in(), m_time);
	if (this->m_numThread == 1)
		return runner.svc();
	else {
		runner.activate( THR_NEW_LWP | THR_JOINABLE | THR_INHERIT_SCHED,
		                 this->m_numThread);
		runner.wait();
	}
	return 0;
}

void
TAO_Naming_Service::shutdown(
    void) {
	if (!CORBA::is_nil(m_orbVar.in())) {
		this->m_orbVar->shutdown(0);
	}
}

int
TAO_Naming_Service::fini(
    void) {
	this->m_myNamingServer.fini();

	try {
		// destroy implies shutdown
		if (!CORBA::is_nil(m_orbVar.in())) {
			this->m_orbVar->destroy();
		}
	} catch (const CORBA::Exception& ex) {
		ex._tao_print_exception("TAO_Naming_Service::fini");
		return -1;
	}
	return 0;
}

// Destructor.
TAO_Naming_Service::~TAO_Naming_Service (
    void) {
	// Destructor
}
