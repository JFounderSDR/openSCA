/**
 * @file Auto_Disconnect.inl
 *
 * $Id: Auto_Disconnect.inl 14 2007-02-01 15:49:12Z mitza $
 *
 * @author Carlos O'Ryan <coryan@uci.edu>
 */
#include "ace/CORBA_macros.h"

template<class Client> ACE_INLINE void
Disconnect<Client>::operator () (Client *client)
{
  try
    {
      client->disconnect ();
    }
  catch (const CORBA::Exception&){ };
}

template<class Client> ACE_INLINE
Auto_Disconnect<Client>::Auto_Disconnect (Client *client)
  :  ACE_Utils::Auto_Functor<Client,Disconnect<Client> > (client)
{
}
