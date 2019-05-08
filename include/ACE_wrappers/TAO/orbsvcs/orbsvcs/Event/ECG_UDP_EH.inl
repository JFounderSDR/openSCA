// -*- C++ -*-
//
// $Id: ECG_UDP_EH.inl 14 2007-02-01 15:49:12Z mitza $

TAO_BEGIN_VERSIONED_NAMESPACE_DECL

ACE_INLINE ACE_SOCK_Dgram&
TAO_ECG_UDP_EH::dgram (void)
{
  return this->dgram_;
}

TAO_END_VERSIONED_NAMESPACE_DECL
