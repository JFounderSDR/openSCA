// -*- C++ -*-

/**
 * @file ORB_Shutdown.inl
 *
 * $Id: ORB_Shutdown.inl 14 2007-02-01 15:49:12Z mitza $
 *
 * @author Carlos O'Ryan <coryan@uci.edu>
 */

ACE_INLINE void
ORB_Shutdown::operator () (CORBA::ORB_ptr orb)
{
  try
    {
      orb->shutdown (0);
    }
  catch (const CORBA::Exception&){ };
}
