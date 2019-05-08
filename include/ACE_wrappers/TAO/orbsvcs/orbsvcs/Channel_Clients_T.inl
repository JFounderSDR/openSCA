// -*- C++ -*-
//
// $Id: Channel_Clients_T.inl 14 2007-02-01 15:49:12Z mitza $

TAO_BEGIN_VERSIONED_NAMESPACE_DECL

template<class TARGET> ACE_INLINE
ACE_PushConsumer_Adapter<TARGET>::ACE_PushConsumer_Adapter (TARGET *t)
  :  target_ (t)
{
}

template<class TARGET> ACE_INLINE
ACE_PushSupplier_Adapter<TARGET>::ACE_PushSupplier_Adapter (TARGET *t)
  :  target_ (t)
{
}

TAO_END_VERSIONED_NAMESPACE_DECL
