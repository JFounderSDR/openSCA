// -*- C++ -*-

//=============================================================================
/**
 *  @file    DLL.h
 *
 *  $Id: DLL.h 1861 2011-08-31 16:18:08Z mesnierp $
 *
 *  @author Kirthika Parameswaran <kirthika@cs.wustl.edu>
 */
//=============================================================================

#ifndef ACE_DLL_H
#define ACE_DLL_H
#include /**/ "ace/pre.h"

#include /**/ "ace/ACE_export.h"

#if !defined (ACE_LACKS_PRAGMA_ONCE)
# pragma once
#endif /* ACE_LACKS_PRAGMA_ONCE */

#include "ace/Global_Macros.h"
#include "ace/os_include/os_dlfcn.h"

ACE_BEGIN_VERSIONED_NAMESPACE_DECL

class ACE_DLL_Handle;

/**
 * @class ACE_DLL
 *
 * @brief Provides an abstract interface for handling various DLL
 * operations.
 *
 * This class is a wrapper over the various methods for utilizing
 * a dynamically linked library (DLL), which is called a shared
 * library on some platforms.  Operations @c open(), @c close(), and
 * @c symbol() have been implemented to help opening/closing and
 * extracting symbol information from a DLL, respectively.
 */
class ACE_Export ACE_DLL
{
public:
  // = Initialization and termination methods.

  /**
   * Default constructor.  By default, the close() operation on the
   * object will be invoked before it is destroyed.
   * @param close_handle_on_destruction  Indicates whether or not the
   *        close() method will be called to close an open DLL when this
   *        object is destroyed. By default, close() will be called.
   *        Set this parameter to 0 for situations where the DLL's lifetime
   *        is controlled in a scope other than that of this ACE_DLL object.
   *        For example, termination by ACE_DLL_Manager via ACE::fini().
   */
  explicit ACE_DLL (bool close_handle_on_destruction = true);

  /// Allow assignment
  ACE_DLL& operator= (const ACE_DLL &rhs);


  /**
   * This constructor performs the actions of open() during construction.
   * @param dll_name  The name or path of the DLL to load.
   * @param open_mode  Flags to alter the actions taken when loading the DLL.
   *        The possible values are:
   *        @li @c RTLD_LAZY (this the default): loads identifier symbols but
   *            not the symbols for functions, which are loaded dynamically
   *            on-demand.
   *        @li @c RTLD_NOW: performs all necessary relocations when
   *            @a dll_name is first loaded
   *        @li RTLD_GLOBAL: makes symbols available for relocation
   *            processing of any other DLLs.
   * @param close_handle_on_destruction  Indicates whether or not the
   *        close() method will be called to close an open DLL when this
   *        object is destroyed. By default, close() will be called.
   *        Set this parameter to 0 for situations where the DLL's lifetime
   *        is controlled in a scope other than that of this ACE_DLL object.
   *        For example, termination by ACE_DLL_Manager via ACE::fini().
   */
  explicit ACE_DLL (const ACE_TCHAR *dll_name,
                    int open_mode = ACE_DEFAULT_SHLIB_MODE,
                    bool close_handle_on_destruction = true);

  /// Copy constructor.
  ACE_DLL (const ACE_DLL &);

  /**
   * This method opens and dynamically links a specified DLL.
   * @param dll_name  The filename or path of the DLL to load.
   *        If a filename is given to @c open(), the @c ACE::ldfind() is used
   *        to locate DLLs via the following algorithms: (1) DLL filename
   *        expansion: @c ACE::ldfind() determines the name of the DLL by
   *        adding the appropriate prefix and suffix, e.g., it adds the @c lib
   *        prefix and @c .so suffix for Solaris and the @c .dll suffix for
   *        Windows and (2) DLL search path: @c ACE::ldfind() will also search
   *        for the designated DLL using the platform's DLL search path
   *        environment variable, e.g., it searches for DLLs using @c
   *        LD_LIBRARY_PATH on many UNIX systems and @c PATH on Windows.
   * @param open_mode  Flags to alter the actions taken when loading the DLL.
   *        The possible values are:
   *        @li @c RTLD_LAZY (this the default): loads identifier symbols but
   *            not the symbols for functions, which are loaded dynamically
   *            on-demand.
   *        @li @c RTLD_NOW: performs all necessary relocations when
   *            @a dll_name is first loaded
   *        @li RTLD_GLOBAL: makes symbols available for relocation
   *            processing of any other DLLs.
   * @param close_handle_on_destruction  Indicates whether or not the
   *        close() method will be called to close an open DLL when this
   *        object is destroyed. By default, close() will be called.
   *        Set this parameter to 0 for situations where the DLL's lifetime
   *        is controlled in a scope other than that of this ACE_DLL object.
   *        For example, termination by ACE_DLL_Manager via ACE::fini().
   * @retval -1 On failure
   * @retval 0 On success.
   */
  int open (const ACE_TCHAR *dll_name,
            int open_mode = ACE_DEFAULT_SHLIB_MODE,
            bool close_handle_on_destruction = true);

  /// Call to close the DLL object.
  int close (void);

  /**
   * Called when the DLL object is destroyed -- invokes close() if the
   * @a close_handle_on_destruction flag was set to non-zero in the
   * constructor or open() method.
   */
  ~ACE_DLL (void);

  /**
   * Look up a named symbol in the DLL. DLL must be successfully opened
   * before calling symbol().
   * @param symbol_name The symbol name to look up.
   * @param ignore_errors If set to 1, allows you to probe a dll without
   *        generating error messages in the log.  Handy for determining
   *        the capabilities of a library.
   * @return Returns the value of @a symbol_name if it is a valid symbol
   *        in the DLL. Otherwise, returns 0.
   */
  void *symbol (const ACE_TCHAR *symbol_name, int ignore_errors = 0);

  /// Returns a pointer to a string explaining that an error occured.  You
  /// will need to consult the error log for the actual error string
  /// returned by the OS.
  ACE_TCHAR *error (void) const;

  /**
   * Return the handle to the caller.  If @a become_owner is non-0 then
   * caller assumes ownership of the handle and the ACE_DLL object
   * won't call close() when it goes out of scope, even if
   * @c close_handle_on_destruction is set.
   */
  ACE_SHLIB_HANDLE get_handle (int become_owner = 0) const;

  /// Set the handle for the DLL object. By default, the close()
  /// operation on / the object will be invoked before it is destroyed.
  int set_handle (ACE_SHLIB_HANDLE handle,
                  bool close_handle_on_destruction = true);

private:

  int open_i (const ACE_TCHAR *dll_name,
              int open_mode = ACE_DEFAULT_SHLIB_MODE,
              bool close_handle_on_destruction = true,
              ACE_SHLIB_HANDLE handle = 0);


  //private:
public:

  /// Open mode.
  int open_mode_;

  /// Keep track of the name of the loaded dll, so it can be used
  /// to remove framework components, singletons that live in the dll,
  /// prior to unloading the dll in the close() method.
  ACE_TCHAR *dll_name_;

  /// This flag keeps track of whether we should close the handle
  /// automatically when the object is destroyed.
  bool close_handle_on_destruction_;

  ACE_DLL_Handle *dll_handle_;

  /// Flag to record if the last operation had an error.
  bool error_;

};

ACE_END_VERSIONED_NAMESPACE_DECL

#include /**/ "ace/post.h"
#endif /* ACE_DLL_H */