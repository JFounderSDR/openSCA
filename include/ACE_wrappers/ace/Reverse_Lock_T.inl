// -*- C++ -*-
//
// $Id: Reverse_Lock_T.inl 14 2007-02-01 15:49:12Z mitza $

#include "ace/config-all.h"
#include "ace/OS_NS_errno.h"

ACE_BEGIN_VERSIONED_NAMESPACE_DECL

template <class ACE_LOCKING_MECHANISM> ACE_INLINE
ACE_Reverse_Lock<ACE_LOCKING_MECHANISM>::ACE_Reverse_Lock (
  ACE_LOCKING_MECHANISM &lock,
  ACE_Acquire_Method::METHOD_TYPE acquire_method)
  : lock_ (lock),
    acquire_method_ (acquire_method)
{
}

ACE_END_VERSIONED_NAMESPACE_DECL
