// -*- C++ -*-
//
// $Id: Non_Servant_Upcall.inl 14 2007-02-01 15:49:12Z mitza $

TAO_BEGIN_VERSIONED_NAMESPACE_DECL

namespace TAO
{
  namespace Portable_Server
  {
    ACE_INLINE ::TAO_Root_POA &
    Non_Servant_Upcall::poa (void) const
    {
      return this->poa_;
    }
  }
}

TAO_END_VERSIONED_NAMESPACE_DECL
