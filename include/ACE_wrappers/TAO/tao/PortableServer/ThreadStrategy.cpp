// $Id: ThreadStrategy.cpp 1861 2011-08-31 16:18:08Z mesnierp $

#include "tao/PortableServer/ThreadStrategy.h"

TAO_BEGIN_VERSIONED_NAMESPACE_DECL

namespace TAO
{
  namespace Portable_Server
  {
    void
    ThreadStrategy::strategy_init (TAO_Root_POA * /*poa*/)
    {
    }

    void
    ThreadStrategy::strategy_cleanup (void)
    {
    }
  }
}

TAO_END_VERSIONED_NAMESPACE_DECL
