// -*- C++ -*-
//
// $Id: EC_Priority_Scheduling.inl 14 2007-02-01 15:49:12Z mitza $

TAO_BEGIN_VERSIONED_NAMESPACE_DECL

ACE_INLINE
TAO_EC_Priority_Scheduling::TAO_EC_Priority_Scheduling (
       RtecScheduler::Scheduler_ptr scheduler)
  :  scheduler_ (RtecScheduler::Scheduler::_duplicate (scheduler))
{
}

TAO_END_VERSIONED_NAMESPACE_DECL
