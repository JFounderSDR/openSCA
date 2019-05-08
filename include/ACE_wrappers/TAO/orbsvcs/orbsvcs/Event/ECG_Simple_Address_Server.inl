// -*- C++ -*-
//
// $Id: ECG_Simple_Address_Server.inl 1861 2011-08-31 16:18:08Z mesnierp $

TAO_BEGIN_VERSIONED_NAMESPACE_DECL

ACE_INLINE PortableServer::Servant_var<TAO_ECG_Simple_Address_Server>
TAO_ECG_Simple_Address_Server::create (void)
{
  PortableServer::Servant_var<TAO_ECG_Simple_Address_Server> s;
  ACE_NEW_RETURN (s,
                  TAO_ECG_Simple_Address_Server,
                  s);
  return s;
}

TAO_END_VERSIONED_NAMESPACE_DECL
