// -*- C++ -*-
//
// $Id: Fixed_TypeCode.inl 14 2007-02-01 15:49:12Z mitza $

TAO_BEGIN_VERSIONED_NAMESPACE_DECL

template <class RefCountPolicy>
ACE_INLINE
TAO::TypeCode::Fixed<RefCountPolicy>::Fixed (CORBA::UShort digits,
                                             CORBA::UShort scale)
  : ::CORBA::TypeCode (CORBA::tk_fixed)
  , RefCountPolicy ()
  , digits_ (digits)
  , scale_ (scale)
{
}

TAO_END_VERSIONED_NAMESPACE_DECL
