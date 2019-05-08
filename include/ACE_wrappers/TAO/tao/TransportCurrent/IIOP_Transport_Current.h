// -*- C++ -*-
// $Id: IIOP_Transport_Current.h 1861 2011-08-31 16:18:08Z mesnierp $

#ifndef IIOP_TRANSPORT_CURRENT_H
#define IIOP_TRANSPORT_CURRENT_H

#include "tao/TransportCurrent/TCC.h"
#include "tao/TransportCurrent/TC_IIOPC.h"
#include "tao/TransportCurrent/IIOP_Current_Loader.h"

#if defined (TAO_AS_STATIC_LIBS)

// Only do this for static builds. It causes a circular dependency for
// dynamic builds.
static int tao_iiop_transport_current_initializer_called =
  TAO::Transport::IIOP::current_static_initializer ();

#endif /* TAO_AS_STATIC_LIBS */

#endif /* IIOP_TRANSPORT_CURRENT_H */
