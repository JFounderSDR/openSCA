// -*- C++ -*-
//
// $Id: PICurrent.inl 14 2007-02-01 15:49:12Z mitza $

TAO_BEGIN_VERSIONED_NAMESPACE_DECL

ACE_INLINE PortableInterceptor::SlotId
TAO::PICurrent::slot_count (void) const
{
  return this->slot_count_;
}

TAO_END_VERSIONED_NAMESPACE_DECL
