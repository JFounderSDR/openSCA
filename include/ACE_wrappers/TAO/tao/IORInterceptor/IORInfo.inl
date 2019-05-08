// -*- C++ -*-
//
// $Id: IORInfo.inl 14 2007-02-01 15:49:12Z mitza $


TAO_BEGIN_VERSIONED_NAMESPACE_DECL

ACE_INLINE void
TAO_IORInfo::invalidate (void)
{
  this->poa_ = 0;
}

ACE_INLINE void
TAO_IORInfo::components_established (void)
{
  this->components_established_ = true;
}

TAO_END_VERSIONED_NAMESPACE_DECL
