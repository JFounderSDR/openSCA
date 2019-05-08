/* -*- C++ -*- */
// $Id: tao_imr.cpp 14 2007-02-01 15:49:12Z mitza $

#include "tao_imr_i.h"

int
ACE_TMAIN (int argc, ACE_TCHAR *argv[])
{
  TAO_IMR_i tao_imr_i;

  if (tao_imr_i.init (argc, argv) != 0)
    return 1;

  return tao_imr_i.run ();
}
