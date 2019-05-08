// $Id: LB_LoadAlertInfo.cpp 1861 2011-08-31 16:18:08Z mesnierp $

#include "orbsvcs/LoadBalancing/LB_LoadAlertInfo.h"
#include "orbsvcs/PortableGroup/PG_Operators.h"

TAO_BEGIN_VERSIONED_NAMESPACE_DECL

TAO_LB_LoadAlertInfo::TAO_LB_LoadAlertInfo (void)
  : load_alert (),
    alerted (0)
{
}

TAO_END_VERSIONED_NAMESPACE_DECL
