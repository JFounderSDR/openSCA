// -*- C++ -*-
//
// $Id: ESF_Immediate_Changes.inl 1861 2011-08-31 16:18:08Z mesnierp $

#include "ace/Guard_T.h"

TAO_BEGIN_VERSIONED_NAMESPACE_DECL

template<class PROXY, class COLLECTION, class ITERATOR, class ACE_LOCK> void
TAO_ESF_Immediate_Changes<PROXY,COLLECTION,ITERATOR,ACE_LOCK>::
    connected (PROXY *proxy)
{
  ACE_GUARD (ACE_LOCK, ace_mon, this->lock_);

  proxy->_incr_refcnt ();
  this->collection_.connected (proxy);
}

template<class PROXY, class COLLECTION, class ITERATOR, class ACE_LOCK> void
TAO_ESF_Immediate_Changes<PROXY,COLLECTION,ITERATOR,ACE_LOCK>::
    reconnected (PROXY *proxy)
{
  ACE_GUARD (ACE_LOCK, ace_mon, this->lock_);

  proxy->_incr_refcnt ();
  this->collection_.reconnected (proxy);
}

template<class PROXY, class COLLECTION, class ITERATOR, class ACE_LOCK> void
TAO_ESF_Immediate_Changes<PROXY,COLLECTION,ITERATOR,ACE_LOCK>::
    disconnected (PROXY *proxy)
{
  ACE_GUARD (ACE_LOCK, ace_mon, this->lock_);

  this->collection_.disconnected (proxy);
}

template<class PROXY, class COLLECTION, class ITERATOR, class ACE_LOCK> void
TAO_ESF_Immediate_Changes<PROXY,COLLECTION,ITERATOR,ACE_LOCK>::shutdown (void)
{
  ACE_GUARD (ACE_LOCK, ace_mon, this->lock_);

  this->collection_.shutdown ();
}

TAO_END_VERSIONED_NAMESPACE_DECL
