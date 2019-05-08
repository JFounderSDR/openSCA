// -*- C++ -*-
// $Id: OS_NS_math.inl 1861 2011-08-31 16:18:08Z mesnierp $

ACE_BEGIN_VERSIONED_NAMESPACE_DECL

namespace ACE_OS {

  ACE_INLINE double
  log2 (double x)
  {
    return ace_log2_helper (x);
  }

} // ACE_OS namespace

ACE_END_VERSIONED_NAMESPACE_DECL
