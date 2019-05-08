// -*- C++ -*-
//
// $Id: TLI_Stream.inl 14 2007-02-01 15:49:12Z mitza $

#include "ace/TLI_Stream.h"

ACE_BEGIN_VERSIONED_NAMESPACE_DECL

ACE_INLINE
void
ACE_TLI_Stream::set_rwflag (int value)
{
  ACE_TRACE ("ACE_TLI_Stream::set_rwflag");
  this->rwflag_ = value;
}

ACE_INLINE
int
ACE_TLI_Stream::get_rwflag (void) const
{
  ACE_TRACE ("ACE_TLI_Stream::get_rwflag");
  return this->rwflag_;
}

ACE_END_VERSIONED_NAMESPACE_DECL
