/**
 * @file RTPOA_Setup.inl
 *
 * $Id: RTPOA_Setup.inl 14 2007-02-01 15:49:12Z mitza $
 *
 * @author Carlos O'Ryan <coryan@uci.edu>
 */

ACE_INLINE PortableServer::POA_ptr
RTPOA_Setup::poa (void)
{
  return PortableServer::POA::_duplicate (this->poa_.in ());
}
