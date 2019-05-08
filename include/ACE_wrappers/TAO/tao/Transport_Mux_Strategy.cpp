// $Id: Transport_Mux_Strategy.cpp 1861 2011-08-31 16:18:08Z mesnierp $

#include "tao/Transport_Mux_Strategy.h"

TAO_BEGIN_VERSIONED_NAMESPACE_DECL

TAO_Transport_Mux_Strategy::TAO_Transport_Mux_Strategy (
  TAO_Transport *transport)
  : transport_ (transport)
{
}

TAO_Transport_Mux_Strategy::~TAO_Transport_Mux_Strategy (void)
{
}

TAO_END_VERSIONED_NAMESPACE_DECL
