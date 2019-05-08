/**
 * @file Auto_Disconnect.cpp
 *
 * $Id: Auto_Disconnect.cpp 14 2007-02-01 15:49:12Z mitza $
 *
 * @author Carlos O'Ryan <coryan@uci.edu>
 */
#ifndef TAO_PERF_RTEC_AUTO_DISCONNECT_CPP
#define TAO_PERF_RTEC_AUTO_DISCONNECT_CPP

#include "Auto_Disconnect.h"

#if !defined(__ACE_INLINE__)
#include "Auto_Disconnect.inl"
#endif /* __ACE_INLINE__ */

template<class Client> Auto_Disconnect<Client>&
Auto_Disconnect<Client>::operator= (Client *client)
{
  this->reset(client);
  return *this;
}

#endif /* TAO_PERF_RTEC_AUTO_DISCONNECT_CPP */
