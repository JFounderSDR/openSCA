// -*- C++ -*-
//
// $Id: Find_Worker_T.inl 14 2007-02-01 15:49:12Z mitza $

TAO_BEGIN_VERSIONED_NAMESPACE_DECL

template<class TYPE, class INTERFACE, class INTERFACE_PTR, class EXCEPTION> ACE_INLINE void
TAO_Notify_Find_Worker_T<TYPE,INTERFACE,INTERFACE_PTR,EXCEPTION>::work (TYPE* type)
{
  if (type->id () == this->id_)
    this->result_ = type;
}

TAO_END_VERSIONED_NAMESPACE_DECL
