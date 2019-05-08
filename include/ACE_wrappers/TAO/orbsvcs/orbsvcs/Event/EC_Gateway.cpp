// $Id: EC_Gateway.cpp 1861 2011-08-31 16:18:08Z mesnierp $

#include "orbsvcs/Event/EC_Gateway.h"

TAO_BEGIN_VERSIONED_NAMESPACE_DECL

TAO_EC_Gateway::TAO_EC_Gateway (void)
  :  handle_ (0)
{
}

TAO_EC_Gateway::~TAO_EC_Gateway (void)
{
}

void
TAO_EC_Gateway::observer_handle (RtecEventChannelAdmin::Observer_Handle h)
{
  this->handle_ = h;
}

RtecEventChannelAdmin::Observer_Handle
TAO_EC_Gateway::observer_handle (void) const
{
  return this->handle_;
}

TAO_END_VERSIONED_NAMESPACE_DECL
