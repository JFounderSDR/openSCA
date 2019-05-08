// -*- C++ -*-
//
// $Id: Messaging_Policy_i.inl 14 2007-02-01 15:49:12Z mitza $

#if (TAO_HAS_SYNC_SCOPE_POLICY == 1)

TAO_BEGIN_VERSIONED_NAMESPACE_DECL

ACE_INLINE void
TAO_Sync_Scope_Policy::get_synchronization (Messaging::SyncScope &s) const
{
  s = this->synchronization_;
}

TAO_END_VERSIONED_NAMESPACE_DECL

#endif /* TAO_HAS_SYNC_SCOPE_POLICY == 1 */
