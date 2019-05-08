// -*- C++ -*-
//
// $Id: POA_Helper.inl 14 2007-02-01 15:49:12Z mitza $

TAO_BEGIN_VERSIONED_NAMESPACE_DECL

ACE_INLINE PortableServer::POA_ptr
TAO_Notify_POA_Helper::poa (void)
{
  return this->poa_.in ();
}

TAO_END_VERSIONED_NAMESPACE_DECL
