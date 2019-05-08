// -*- C++ -*-
//
// $Id: Container_T.inl 14 2007-02-01 15:49:12Z mitza $

TAO_BEGIN_VERSIONED_NAMESPACE_DECL

template<class TYPE> ACE_INLINE typename TAO_Notify_Container_T<TYPE>::COLLECTION*
TAO_Notify_Container_T<TYPE>:: collection (void)
{
  return this->collection_;
}

TAO_END_VERSIONED_NAMESPACE_DECL
