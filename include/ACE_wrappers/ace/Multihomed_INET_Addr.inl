// -*- C++ -*-
//
// $Id: Multihomed_INET_Addr.inl 14 2007-02-01 15:49:12Z mitza $

ACE_BEGIN_VERSIONED_NAMESPACE_DECL

// Accessor implementations
ACE_INLINE
size_t
ACE_Multihomed_INET_Addr::get_num_secondary_addresses() const
{
  return this->secondaries_.size();
}

ACE_END_VERSIONED_NAMESPACE_DECL
