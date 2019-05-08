// -*- C++ -*-
//
// $Id: Reactor_Notification_Strategy.inl 14 2007-02-01 15:49:12Z mitza $

ACE_BEGIN_VERSIONED_NAMESPACE_DECL

ACE_INLINE ACE_Reactor *
ACE_Reactor_Notification_Strategy::reactor (void)
{
  return this->reactor_;
}

ACE_INLINE void
ACE_Reactor_Notification_Strategy::reactor (ACE_Reactor *r)
{
  this->reactor_ = r;
}

ACE_END_VERSIONED_NAMESPACE_DECL
