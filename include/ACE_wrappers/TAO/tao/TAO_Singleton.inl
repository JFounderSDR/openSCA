// -*- C++ -*-
//
// $Id: TAO_Singleton.inl 14 2007-02-01 15:49:12Z mitza $


TAO_BEGIN_VERSIONED_NAMESPACE_DECL

// Default constructors.
//
// Note: don't explicitly initialize "instance_", because TYPE may not
// have a default constructor.  Let the compiler figure it out . . .

template <class TYPE, class ACE_LOCK> ACE_INLINE
TAO_Singleton<TYPE, ACE_LOCK>::TAO_Singleton (void)
{
}

template <class TYPE, class ACE_LOCK> ACE_INLINE
TAO_TSS_Singleton<TYPE, ACE_LOCK>::TAO_TSS_Singleton (void)
{
}

TAO_END_VERSIONED_NAMESPACE_DECL
