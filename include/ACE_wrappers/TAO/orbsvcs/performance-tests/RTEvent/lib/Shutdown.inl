/**
 * @file Shutdown.inl
 *
 * $Id: Shutdown.inl 14 2007-02-01 15:49:12Z mitza $
 *
 * @author Carlos O'Ryan <coryan@uci.edu>
 */

template<class Client> ACE_INLINE void
Shutdown<Client>::operator () (Client *client)
{
  try
    {
      client->shutdown ();
    }
  catch (const CORBA::Exception&){ };
}
