// =================================================================
/**
 * @file OC_Endpoint_Selector_Loader.cpp
 *
 * $Id: OC_Endpoint_Selector_Loader.cpp 1861 2011-08-31 16:18:08Z mesnierp $
 *
 * @author Phil Mesnier <mesnier_p@ociweb.com>
 *
 */
// =================================================================
// $Id: OC_Endpoint_Selector_Loader.cpp 1861 2011-08-31 16:18:08Z mesnierp $

#include "tao/Strategies/OC_Endpoint_Selector_Loader.h"
#include "tao/Strategies/OC_Endpoint_Selector_Factory.h"

TAO_BEGIN_VERSIONED_NAMESPACE_DECL

int
TAO_OC_Endpoint_Selector_Loader::init (void)
{
  return  ACE_Service_Config::process_directive (ace_svc_desc_TAO_OC_Endpoint_Selector_Factory);
}

TAO_END_VERSIONED_NAMESPACE_DECL
