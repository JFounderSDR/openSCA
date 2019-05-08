// -*- C++ -*-
//
// $Id: CEC_Reactive_Pulling_Strategy.inl 14 2007-02-01 15:49:12Z mitza $

TAO_BEGIN_VERSIONED_NAMESPACE_DECL

ACE_INLINE
TAO_CEC_Pull_Event::TAO_CEC_Pull_Event (TAO_CEC_ConsumerAdmin *consumer_admin,
                                        TAO_CEC_SupplierControl *control)
  :  consumer_admin_ (consumer_admin),
     supplier_control_ (control)
{
}

TAO_END_VERSIONED_NAMESPACE_DECL
