// -*- C++ -*-
//
// $Id: Supplier.inl 14 2007-02-01 15:49:12Z mitza $

TAO_BEGIN_VERSIONED_NAMESPACE_DECL

ACE_INLINE TAO_Notify_ProxyConsumer*
TAO_Notify_Supplier::proxy_consumer (void)
{
  return this->proxy_;
}

TAO_END_VERSIONED_NAMESPACE_DECL
