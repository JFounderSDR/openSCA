// -*- C++ -*-
//
// $Id: SPIPE.inl 14 2007-02-01 15:49:12Z mitza $

ACE_BEGIN_VERSIONED_NAMESPACE_DECL

ACE_INLINE int
ACE_SPIPE::disable (int signum) const
{
#if defined (ACE_WIN32)
  ACE_UNUSED_ARG (signum) ;
  return 0 ;
#else  /* ACE_WIN32 */
  return ACE_IPC_SAP::disable (signum) ;
#endif /* ACE_WIN32 */
}

ACE_END_VERSIONED_NAMESPACE_DECL
