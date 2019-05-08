// -*- C++ -*-
//
// $Id: Token_Manager.inl 14 2007-02-01 15:49:12Z mitza $

#if defined (ACE_HAS_TOKENS_LIBRARY)

ACE_BEGIN_VERSIONED_NAMESPACE_DECL

ACE_INLINE ACE_TOKEN_CONST::MUTEX &
ACE_Token_Manager::mutex (void)
{
  ACE_TRACE ("ACE_Token_Manager::mutex");
  return lock_;
}

ACE_INLINE void
ACE_Token_Manager::debug (bool d)
{
  ACE_TRACE ("ACE_Token_Manager::debug");
  debug_ = d;
}

ACE_END_VERSIONED_NAMESPACE_DECL

#endif /* ACE_HAS_TOKENS_LIBRARY */
