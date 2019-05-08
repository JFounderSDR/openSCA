// -*- C++ -*-
//
// $Id: EC_Kokyu_Factory.inl 14 2007-02-01 15:49:12Z mitza $

TAO_BEGIN_VERSIONED_NAMESPACE_DECL

ACE_INLINE
TAO_EC_Kokyu_Factory::TAO_EC_Kokyu_Factory (void)
  :  TAO_EC_Default_Factory (),
     disp_sched_policy_ (ACE_SCHED_FIFO),
     disp_sched_scope_ (ACE_SCOPE_THREAD)
{
}

TAO_END_VERSIONED_NAMESPACE_DECL
