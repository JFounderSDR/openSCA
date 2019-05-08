// -*- C++ -*-
//
// $Id: Ping_Socket.inl 14 2007-02-01 15:49:12Z mitza $

ACE_BEGIN_VERSIONED_NAMESPACE_DECL

ACE_INLINE char *
ACE_Ping_Socket::icmp_recv_buff (void)
{
  return this->icmp_recv_buff_;
}

ACE_END_VERSIONED_NAMESPACE_DECL
