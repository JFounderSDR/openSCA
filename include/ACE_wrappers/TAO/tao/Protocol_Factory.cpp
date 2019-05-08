// $Id: Protocol_Factory.cpp 1861 2011-08-31 16:18:08Z mesnierp $

#include "tao/Protocol_Factory.h"

TAO_BEGIN_VERSIONED_NAMESPACE_DECL

TAO_Protocol_Factory::TAO_Protocol_Factory (CORBA::ULong tag)
  : tag_ (tag)
{
}

TAO_Protocol_Factory::~TAO_Protocol_Factory (void)
{
}

CORBA::ULong
TAO_Protocol_Factory::tag (void) const
{
  return this->tag_;
}

TAO_END_VERSIONED_NAMESPACE_DECL
