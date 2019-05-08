// -*- C++ -*-
//
// $Id: Asynch_Reply_Dispatcher_Base.inl 1861 2011-08-31 16:18:08Z mesnierp $

TAO_BEGIN_VERSIONED_NAMESPACE_DECL

namespace TAO
{
  ACE_INLINE void
  ARDB_Refcount_Functor::operator () (
      TAO_Asynch_Reply_Dispatcher_Base *ardb) throw ()
  {
    (void) ardb->intrusive_remove_ref (ardb);
  }
}

TAO_END_VERSIONED_NAMESPACE_DECL
