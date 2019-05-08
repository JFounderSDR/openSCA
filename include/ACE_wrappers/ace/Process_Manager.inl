// -*- C++ -*-
//
// $Id: Process_Manager.inl 14 2007-02-01 15:49:12Z mitza $

ACE_BEGIN_VERSIONED_NAMESPACE_DECL

ACE_INLINE size_t
ACE_Process_Manager::managed (void) const
{
  return current_count_;
}

ACE_END_VERSIONED_NAMESPACE_DECL
