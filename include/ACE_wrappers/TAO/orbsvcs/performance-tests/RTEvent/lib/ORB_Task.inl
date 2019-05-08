/**
 * @file ORB_Task.inl
 *
` * $Id: ORB_Task.inl 14 2007-02-01 15:49:12Z mitza $
 *
 * @author Carlos O'Ryan <coryan@uci.edu>
 */

ACE_INLINE CORBA::ORB_ptr
ORB_Task::operator-> (void) const
{
  return this->orb_.in ();
}
