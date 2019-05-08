// $Id: LB_LoadAlert.cpp 1861 2011-08-31 16:18:08Z mesnierp $

#include "orbsvcs/LoadBalancing/LB_LoadAlert.h"

#if !defined (__ACE_INLINE__)
# include "orbsvcs/LoadBalancing/LB_LoadAlert.inl"
#endif /* __ACE_INLINE__ */

TAO_BEGIN_VERSIONED_NAMESPACE_DECL

TAO_LB_LoadAlert::TAO_LB_LoadAlert (void)
  : alerted_ (0),
    lock_ ()
{
}

TAO_LB_LoadAlert::~TAO_LB_LoadAlert (void)
{
}

void
TAO_LB_LoadAlert::enable_alert (void)
{
  ACE_GUARD (TAO_SYNCH_MUTEX, monitor, this->lock_);

  this->alerted_ = 1;
}

void
TAO_LB_LoadAlert::disable_alert (void)
{
  ACE_GUARD (TAO_SYNCH_MUTEX, monitor, this->lock_);

  this->alerted_ = 0;
}

TAO_END_VERSIONED_NAMESPACE_DECL
