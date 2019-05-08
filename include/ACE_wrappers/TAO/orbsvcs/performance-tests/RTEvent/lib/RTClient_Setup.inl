/**
 * @file RTClient_Setup.inl
 *
 * $Id: RTClient_Setup.inl 14 2007-02-01 15:49:12Z mitza $
 *
 * @author Carlos O'Ryan <coryan@uci.edu>
 */

ACE_INLINE int
RTClient_Setup::use_rt_corba (void) const
{
  return this->use_rt_corba_;
}

ACE_INLINE RTCORBA_Setup *
RTClient_Setup::rtcorba_setup (void)
{
  return this->rtcorba_setup_.get ();
}
