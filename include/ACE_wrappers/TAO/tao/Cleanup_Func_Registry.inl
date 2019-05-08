// -*- C++ -*-
//
// $Id: Cleanup_Func_Registry.inl 14 2007-02-01 15:49:12Z mitza $

TAO_BEGIN_VERSIONED_NAMESPACE_DECL

ACE_INLINE
TAO_Cleanup_Func_Registry::TAO_Cleanup_Func_Registry (void)
  : cleanup_funcs_ ()
{
}

ACE_INLINE size_t
TAO_Cleanup_Func_Registry::size (void) const
{
  return this->cleanup_funcs_.size ();
}

TAO_END_VERSIONED_NAMESPACE_DECL
