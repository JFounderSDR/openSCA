// $Id: PG_MemberInfo.cpp 1861 2011-08-31 16:18:08Z mesnierp $

#include "orbsvcs/PortableGroup/PG_MemberInfo.h"
#include "orbsvcs/PortableGroup/PG_Operators.h"

TAO_BEGIN_VERSIONED_NAMESPACE_DECL

bool
TAO_PG_MemberInfo::operator== (const TAO_PG_MemberInfo & rhs) const
{
  // For the purposes of the member info set, only the location is
  // important.
  return location == rhs.location;
}

TAO_END_VERSIONED_NAMESPACE_DECL
