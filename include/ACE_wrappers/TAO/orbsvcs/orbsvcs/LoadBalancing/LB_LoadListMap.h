// -*- C++ -*-

//=======================================================================
/**
 *  @file    LB_LoadListMap.h
 *
 *  $Id: LB_LoadListMap.h 14 2007-02-01 15:49:12Z mitza $
 *
 *  @author  Ossama Othman <ossama@uci.edu>
 */
//=======================================================================


#ifndef TAO_LB_LOAD_LIST_MAP_H
#define TAO_LB_LOAD_LIST_MAP_H

#include /**/ "ace/pre.h"

#include "orbsvcs/CosLoadBalancingC.h"

#if !defined (ACE_LACKS_PRAGMA_ONCE)
# pragma once
#endif /* ACE_LACKS_PRAGMA_ONCE */

#include "orbsvcs/PortableGroupC.h"

#include "orbsvcs/PortableGroup/PG_Location_Hash.h"
#include "orbsvcs/PortableGroup/PG_Location_Equal_To.h"

#include "ace/Hash_Map_Manager_T.h"

TAO_BEGIN_VERSIONED_NAMESPACE_DECL

/// LoadList hash map.
typedef ACE_Hash_Map_Manager_Ex<
  PortableGroup::Location,
  CosLoadBalancing::LoadList,
  TAO_PG_Location_Hash,
  TAO_PG_Location_Equal_To,
  ACE_Null_Mutex> TAO_LB_LoadListMap;

TAO_END_VERSIONED_NAMESPACE_DECL

#include /**/ "ace/post.h"

#endif  /* TAO_LB_LOAD_LIST_MAP_H */
