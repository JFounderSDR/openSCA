// $Id: Null_Fragmentation_Strategy.cpp 935 2008-12-10 21:47:27Z mitza $

#include "tao/Null_Fragmentation_Strategy.h"

TAO_Null_Fragmentation_Strategy::~TAO_Null_Fragmentation_Strategy (void)
{
}

int
TAO_Null_Fragmentation_Strategy::fragment (TAO_OutputCDR &,
                                           ACE_CDR::ULong,
                                           ACE_CDR::ULong)
{
  return 0;
}
