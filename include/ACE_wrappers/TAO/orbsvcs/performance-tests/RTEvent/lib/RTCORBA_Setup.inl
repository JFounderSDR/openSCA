/**
 * @file RTCORBA_Setup.inl
 *
 * $Id: RTCORBA_Setup.inl 14 2007-02-01 15:49:12Z mitza $
 *
 * @author Carlos O'Ryan <coryan@uci.edu>
 */

ACE_INLINE const RTCORBA::ThreadpoolLanes &
RTCORBA_Setup::lanes (void) const
{
  return this->lanes_;
}

ACE_INLINE RTCORBA::Priority
RTCORBA_Setup::process_priority (void) const
{
  return this->process_priority_;
}
