// -*- C++ -*-

//=============================================================================
/**
 *  @file   create_persistent_poa.h
 *
 *  $Id: create_persistent_poa.h 14 2007-02-01 15:49:12Z mitza $
 *
 *  @author Huang-Ming Huang <hh1@cse.wustl.edu>
 */
//=============================================================================
#ifndef CREATE_PERSISTENT_POA_H
#define CREATE_PERSISTENT_POA_H
#include "tao/PortableServer/PortableServer.h"

#if !defined (ACE_LACKS_PRAGMA_ONCE)
# pragma once
#endif /* ACE_LACKS_PRAGMA_ONCE */

TAO_BEGIN_VERSIONED_NAMESPACE_DECL

PortableServer::POA_var create_persistent_poa(PortableServer::POA_var root_poa,
                                              PortableServer::POAManager_var mgr,
                                              const char* name,
                                              CORBA::PolicyList& policy_list);

TAO_END_VERSIONED_NAMESPACE_DECL

#endif
