/***************************************************************************//**
* @file     Naming_Service.h
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

#ifndef TAO_NAMING_SERVICE_H
#define TAO_NAMING_SERVICE_H

#include "orbsvcs/Naming/Naming_Server.h"

/**
 * @class TAO_Naming_Service
 *
 * @brief Defines a class that encapsulates the implementation of the
 * COS Naming Service.
 *
 * This class makes use of the <TAO_Naming_Server>
 * to implement the COS Naming Service.
 */
class TAO_Naming_Service {
  public:
	/// Default Constructor.
	TAO_Naming_Service (
	    void);

	/// Constructor taking the command-line arguments.
	TAO_Naming_Service (
	    int argc,
	    ACE_TCHAR * argv[]);

	/// Initialize the Naming Service with the arguments.
	virtual int
	init (
	    int argc,
	    ACE_TCHAR * argv[]);

	/// The opposite of init().
	virtual int
	fini (
	    void);

	/// Run the TAO_Naming_Service.
	int
	run (
	    void);

	/// Shut down the TAO_Naming_Service; you must still call fini().
	void
	shutdown (
	    void);

	/// Destructor.
	virtual ~TAO_Naming_Service (
	    void);

  protected:

	// Parse the command line arguments to find the timeout period.
	int
	parse_args (
	    int &argc,
	    ACE_TCHAR * argv[]);

	// The ORB.
	CORBA::ORB_var m_orbVar;
	// Naming Server instance.
	TAO_Naming_Server m_myNamingServer;
	// After how long the server should stop listening to requests (in seconds).
	long m_time;
	// Number of threads for running the ORB. Default is 1.
	int m_numThread;
};

#endif /* TAO_NAMING_SERVICE_H */