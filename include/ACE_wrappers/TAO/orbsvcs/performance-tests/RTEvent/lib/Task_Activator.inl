/**
 * @file Task_Activator.inl
 *
` * $Id: Task_Activator.inl 14 2007-02-01 15:49:12Z mitza $
 *
 * @author Carlos O'Ryan <coryan@uci.edu>
 */

template<class Task> ACE_INLINE void
Task_Activator<Task>::release ()
{
  this->task_ = 0;
}
