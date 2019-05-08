// -*- C++ -*-
// $Id: Refcounted_ObjectKey.inl 1861 2011-08-31 16:18:08Z mesnierp $

TAO_BEGIN_VERSIONED_NAMESPACE_DECL

ACE_INLINE void
TAO::Refcounted_ObjectKey::incr_refcount (void)
{
  ++this->ref_count_;
}

ACE_INLINE const TAO::ObjectKey &
TAO::Refcounted_ObjectKey::object_key (void) const
{
  return this->object_key_;
}

ACE_INLINE CORBA::ULong
TAO::Refcounted_ObjectKey::decr_refcount (void)
{
  if (--this->ref_count_ > 0)
    {
      return this->ref_count_;
    }

  ACE_ASSERT (this->ref_count_ == 0);

  delete this;

  return 0;
}


TAO_END_VERSIONED_NAMESPACE_DECL
