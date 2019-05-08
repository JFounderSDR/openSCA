// $Id: Message_Queue.cpp 1861 2011-08-31 16:18:08Z mesnierp $

#include "ace/Message_Queue.h"
#include "ace/Log_Msg.h"

#if !defined (__ACE_INLINE__)
#include "ace/Message_Queue.inl"
#endif /* __ACE_INLINE__ */

ACE_BEGIN_VERSIONED_NAMESPACE_DECL

ACE_Message_Queue_Base::~ACE_Message_Queue_Base (void)
{
}

int
ACE_Message_Queue_Base::state (void)
{
  ACE_TRACE ("ACE_Message_Queue_Base::state");

  return this->state_;
}

ACE_END_VERSIONED_NAMESPACE_DECL
