// -*- C++ -*-
// $Id: DynValueCommon_i.cpp 1861 2011-08-31 16:18:08Z mesnierp $

#include "tao/DynamicAny/DynValueCommon_i.h"

TAO_BEGIN_VERSIONED_NAMESPACE_DECL

TAO_DynValueCommon_i::TAO_DynValueCommon_i (void)
{
}

TAO_DynValueCommon_i::~TAO_DynValueCommon_i (void)
{
}

CORBA::Boolean
TAO_DynValueCommon_i::is_null (void)
{
  throw ::CORBA::NO_IMPLEMENT ();
}

void
TAO_DynValueCommon_i::set_to_null (void)
{
  throw ::CORBA::NO_IMPLEMENT ();
}

void
TAO_DynValueCommon_i::set_to_value (void)
{
  throw ::CORBA::NO_IMPLEMENT ();
}

TAO_END_VERSIONED_NAMESPACE_DECL

