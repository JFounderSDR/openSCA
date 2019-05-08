// -*- C++ -*-
//
// $Id: SSLIOP_Current_Impl.inl 14 2007-02-01 15:49:12Z mitza $


TAO_BEGIN_VERSIONED_NAMESPACE_DECL

ACE_INLINE
TAO::SSLIOP::Current_Impl::Current_Impl (void)
  : ssl_ (0)
{
}

ACE_INLINE void
TAO::SSLIOP::Current_Impl::ssl (SSL *s)
{
  this->ssl_ = s;
}

ACE_INLINE SSL *
TAO::SSLIOP::Current_Impl::ssl (void)
{
  return this->ssl_;
}

TAO_END_VERSIONED_NAMESPACE_DECL
