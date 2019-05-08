// -*- C++ -*-
//
// $Id: Thread_Adapter.inl 14 2007-02-01 15:49:12Z mitza $

ACE_BEGIN_VERSIONED_NAMESPACE_DECL

ACE_INLINE ACE_Thread_Manager *
ACE_Thread_Adapter::thr_mgr (void)
{
  return this->thr_mgr_;
}

ACE_END_VERSIONED_NAMESPACE_DECL
