// -*- C++ -*-
//
// $Id: String_TypeCode_Static.inl 14 2007-02-01 15:49:12Z mitza $

TAO_BEGIN_VERSIONED_NAMESPACE_DECL

ACE_INLINE
TAO::TypeCode::String<TAO::Null_RefCount_Policy>::String (
  CORBA::TCKind kind,
  CORBA::ULong length)
  : ::CORBA::TypeCode (kind)
  , ::TAO::Null_RefCount_Policy ()
  , length_ (length)
{
  // ACE_ASSERT (kind == CORBA::tk_string || kind == CORBA::tk_wstring);
}

TAO_END_VERSIONED_NAMESPACE_DECL
