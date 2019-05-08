// -*- C++ -*-
//
// $Id: SPIPE_Connector.inl 935 2008-12-10 21:47:27Z mitza $

ACE_BEGIN_VERSIONED_NAMESPACE_DECL

ACE_INLINE bool
ACE_SPIPE_Connector::reset_new_handle (ACE_HANDLE)
{
  // Nothing to do here since the handle is not a socket
  return false;
}

ACE_END_VERSIONED_NAMESPACE_DECL
