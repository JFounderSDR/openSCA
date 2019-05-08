// $Id: ECG_ConsumerEC_Control.cpp 1861 2011-08-31 16:18:08Z mesnierp $

#include "orbsvcs/Event/ECG_ConsumerEC_Control.h"



TAO_BEGIN_VERSIONED_NAMESPACE_DECL

TAO_ECG_ConsumerEC_Control::TAO_ECG_ConsumerEC_Control (void)
{
}

TAO_ECG_ConsumerEC_Control::~TAO_ECG_ConsumerEC_Control (void)
{
}

int
TAO_ECG_ConsumerEC_Control::activate (void)
{
  return 0;
}

int
TAO_ECG_ConsumerEC_Control::shutdown (void)
{
  return 0;
}

void
TAO_ECG_ConsumerEC_Control::event_channel_not_exist (TAO_EC_Gateway_IIOP *)
{
}

void
TAO_ECG_ConsumerEC_Control::system_exception (TAO_EC_Gateway_IIOP *,
                                              CORBA::SystemException &)
{
}

TAO_END_VERSIONED_NAMESPACE_DECL
