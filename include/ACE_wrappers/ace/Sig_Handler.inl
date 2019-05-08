// -*- C++ -*-
//
// $Id: Sig_Handler.inl 14 2007-02-01 15:49:12Z mitza $

ACE_INLINE
ACE_Sig_Handler::ACE_Sig_Handler (void)
{
}

ACE_INLINE int
ACE_Sig_Handler::in_range (int signum)
{
  ACE_TRACE ("ACE_Sig_Handler::in_range");
  return signum > 0 && signum < ACE_NSIG;
}
