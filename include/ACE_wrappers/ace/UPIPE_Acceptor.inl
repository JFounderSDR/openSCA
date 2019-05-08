// -*- C++ -*-
//
// $Id: UPIPE_Acceptor.inl 14 2007-02-01 15:49:12Z mitza $

ACE_BEGIN_VERSIONED_NAMESPACE_DECL

ACE_INLINE int
ACE_UPIPE_Acceptor::remove (void)
{
  ACE_TRACE ("ACE_UPIPE_Acceptor::remove");
  return this->ACE_SPIPE_Acceptor::remove ();
}

ACE_END_VERSIONED_NAMESPACE_DECL
