/**
 * @file Implicit_Deactivator.inl
 *
 * $Id: Implicit_Deactivator.inl 14 2007-02-01 15:49:12Z mitza $
 *
 * @author Carlos O'Ryan <coryan@uci.edu>
 */

ACE_INLINE void
Implicit_Deactivator::release (void)
{
  this->id_ = 0;
}
