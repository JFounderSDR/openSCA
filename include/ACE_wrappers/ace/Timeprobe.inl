// -*- C++ -*-
//
// $Id: Timeprobe.inl 14 2007-02-01 15:49:12Z mitza $

ACE_BEGIN_VERSIONED_NAMESPACE_DECL

ACE_INLINE bool
ACE_Event_Descriptions::operator== (const ACE_Event_Descriptions &rhs) const
{
  return this->minimum_id_ == rhs.minimum_id_ &&
    this->descriptions_ == rhs.descriptions_;
}

ACE_END_VERSIONED_NAMESPACE_DECL
