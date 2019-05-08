// -*- C++ -*-
//
// $Id: Alias_TypeCode_Static.inl 14 2007-02-01 15:49:12Z mitza $

TAO_BEGIN_VERSIONED_NAMESPACE_DECL

ACE_INLINE
TAO::TypeCode::Alias<char const *,
                     CORBA::TypeCode_ptr const *,
                     TAO::Null_RefCount_Policy>::Alias (
  CORBA::TCKind kind,
  char const * id,
  char const * name,
  CORBA::TypeCode_ptr const * tc)
  : ::CORBA::TypeCode (kind)
  , ::TAO::Null_RefCount_Policy ()
  , attributes_ (id, name)
  , content_type_ (tc)
{
}

TAO_END_VERSIONED_NAMESPACE_DECL
