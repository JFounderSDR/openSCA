// -*- C++ -*-
//
// $Id: Dynamic.inl 14 2007-02-01 15:49:12Z mitza $

ACE_BEGIN_VERSIONED_NAMESPACE_DECL

ACE_INLINE
ACE_Dynamic::~ACE_Dynamic (void)
{
  // ACE_TRACE ("ACE_Dynamic::~ACE_Dynamic");
}

ACE_INLINE void
ACE_Dynamic::set (void)
{
  // ACE_TRACE ("ACE_Dynamic::set");
  this->is_dynamic_ = true;
}

ACE_INLINE bool
ACE_Dynamic::is_dynamic (void)
{
  // ACE_TRACE ("ACE_Dynamic::is_dynamic");
  return this->is_dynamic_;
}

ACE_INLINE void
ACE_Dynamic::reset (void)
{
  // ACE_TRACE ("ACE_Dynamic::reset");
  this->is_dynamic_ = false;
}

ACE_END_VERSIONED_NAMESPACE_DECL
