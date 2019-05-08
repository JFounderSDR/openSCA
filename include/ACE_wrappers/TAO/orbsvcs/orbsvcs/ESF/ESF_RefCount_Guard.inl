// -*- C++ -*-
//
// $Id: ESF_RefCount_Guard.inl 935 2008-12-10 21:47:27Z mitza $

TAO_BEGIN_VERSIONED_NAMESPACE_DECL

template<class T> ACE_INLINE
TAO_ESF_RefCount_Guard<T>::
    TAO_ESF_RefCount_Guard (T &refcount)
  :  refcount_ (refcount)
{
  ++this->refcount_;
}

template<class T> ACE_INLINE
TAO_ESF_RefCount_Guard<T>::
    ~TAO_ESF_RefCount_Guard (void)
{
  --this->refcount_;
}

TAO_END_VERSIONED_NAMESPACE_DECL
