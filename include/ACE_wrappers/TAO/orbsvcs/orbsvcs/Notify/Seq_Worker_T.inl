// -*- C++ -*-
//
// $Id: Seq_Worker_T.inl 14 2007-02-01 15:49:12Z mitza $

TAO_BEGIN_VERSIONED_NAMESPACE_DECL

template<class TYPE> ACE_INLINE void
TAO_Notify_Seq_Worker_T<TYPE>::work (TYPE* type)
{
  this->seq_->length (this->seq_->length () + 1);

  this->seq_[this->seq_->length () - 1] = type->id ();
}

TAO_END_VERSIONED_NAMESPACE_DECL
