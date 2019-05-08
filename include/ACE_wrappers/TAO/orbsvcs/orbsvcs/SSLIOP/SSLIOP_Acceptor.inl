// -*- C++ -*-
//
// $Id: SSLIOP_Acceptor.inl 14 2007-02-01 15:49:12Z mitza $


TAO_BEGIN_VERSIONED_NAMESPACE_DECL

ACE_INLINE const SSLIOP::SSL &
TAO::SSLIOP::Acceptor::ssl_component (void) const
{
  return this->ssl_component_;
}

TAO_END_VERSIONED_NAMESPACE_DECL
