// -*- C++ -*-
//
// $Id: PolicyList_Destroyer.inl 14 2007-02-01 15:49:12Z mitza $

TAO_BEGIN_VERSIONED_NAMESPACE_DECL

ACE_INLINE
TAO::Utils::PolicyList_Destroyer::PolicyList_Destroyer (CORBA::ULong length_hint)
  : CORBA::PolicyList(length_hint)
{
}

TAO_END_VERSIONED_NAMESPACE_DECL
