// -*- C++ -*-
//
// $Id: POSIX_Proactor.inl 14 2007-02-01 15:49:12Z mitza $

ACE_BEGIN_VERSIONED_NAMESPACE_DECL

ACE_INLINE
ACE_Asynch_Pseudo_Task& ACE_POSIX_Proactor::get_asynch_pseudo_task (void)
{
  return this->pseudo_task_;
}

ACE_END_VERSIONED_NAMESPACE_DECL
