// -*- C++ -*-
//
// $Id: ExceptionList.inl 1861 2011-08-31 16:18:08Z mesnierp $

TAO_BEGIN_VERSIONED_NAMESPACE_DECL

ACE_INLINE
CORBA::ExceptionList::ExceptionList (void)
  : ref_count_ (1)
{
}

ACE_INLINE
CORBA::ULong
CORBA::ExceptionList::count (void)
{
  return (CORBA::ULong) this->tc_list_.size ();
}

ACE_INLINE
CORBA::ExceptionList_ptr
CORBA::ExceptionList::_nil (void)
{
  return static_cast<CORBA::ExceptionList_ptr>(0);
}

ACE_INLINE
CORBA::ExceptionList_ptr
CORBA::ExceptionList::_duplicate (CORBA::ExceptionList_ptr x)
{
  if (x != 0)
    {
      x->_incr_refcount ();
    }

  return x;
}

TAO_END_VERSIONED_NAMESPACE_DECL
