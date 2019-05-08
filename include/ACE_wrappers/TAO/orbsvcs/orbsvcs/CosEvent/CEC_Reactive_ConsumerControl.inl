// -*- C++ -*-
//
// $Id: CEC_Reactive_ConsumerControl.inl 14 2007-02-01 15:49:12Z mitza $

TAO_BEGIN_VERSIONED_NAMESPACE_DECL

ACE_INLINE
TAO_CEC_Ping_Push_Consumer::
    TAO_CEC_Ping_Push_Consumer (TAO_CEC_ConsumerControl *control)
  :  control_ (control)
{
}

// ****************************************************************

ACE_INLINE
TAO_CEC_Ping_Pull_Consumer::
    TAO_CEC_Ping_Pull_Consumer (TAO_CEC_ConsumerControl *control)
  :  control_ (control)
{
}

TAO_END_VERSIONED_NAMESPACE_DECL
