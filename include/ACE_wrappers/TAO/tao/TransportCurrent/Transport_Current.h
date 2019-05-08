// -*- C++ -*-
// $Id: Transport_Current.h 1861 2011-08-31 16:18:08Z mesnierp $

#ifndef TRANSPORT_CURRENT_H
#define TRANSPORT_CURRENT_H

#include "tao/TransportCurrent/TCC.h"
#include "tao/TransportCurrent/Current_Loader.h"

#if defined (TAO_AS_STATIC_LIBS)

// Only do this for static builds. It causes a circular dependency for
// dynamic builds.
static int tao_transport_current_initializer_called =
  TAO::Transport::current_static_initializer ();

#endif /* TAO_AS_STATIC_LIBS */

#endif /* TRANSPORT_CURRENT_H */
