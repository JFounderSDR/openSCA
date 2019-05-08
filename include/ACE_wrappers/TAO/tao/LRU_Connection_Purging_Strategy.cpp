// $Id: LRU_Connection_Purging_Strategy.cpp 1861 2011-08-31 16:18:08Z mesnierp $

#include "tao/LRU_Connection_Purging_Strategy.h"
#include "tao/Transport.h"

TAO_BEGIN_VERSIONED_NAMESPACE_DECL

TAO_LRU_Connection_Purging_Strategy::TAO_LRU_Connection_Purging_Strategy (
                                                           int cache_maximum)
 : TAO_Connection_Purging_Strategy (cache_maximum),
   order_ (0)
{
}


TAO_LRU_Connection_Purging_Strategy::~TAO_LRU_Connection_Purging_Strategy (void)
{
}


void
TAO_LRU_Connection_Purging_Strategy::update_item (TAO_Transport& transport)
{
  transport.purging_order (++this->order_);
}

TAO_END_VERSIONED_NAMESPACE_DECL
