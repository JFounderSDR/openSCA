# -*- makefile -*-
#----------------------------------------------------------------------------
#       GNU ACE Workspace
#
# $Id: GNUACEWorkspaceCreator.pm 1861 2011-08-31 16:18:08Z mesnierp $
#
# This file was generated by MPC.  Any changes made directly to
# this file will be lost the next time it is generated.
#
# MPC Command:
# C:\ACE_wrappers\bin\mwc.pl -type gnuace
#
#----------------------------------------------------------------------------

MAKEFILE = GNUmakefile

ifeq ($(findstring k,$(MAKEFLAGS)),k)
  KEEP_GOING = -
endif

include $(ACE_ROOT)/include/makeinclude/macros.GNU

all: IORInterceptor_Idl IORInterceptor

REMAINING_TARGETS := $(filter-out all,$(TARGETS_NESTED:.nested=)) $(CUSTOM_TARGETS)

$(REMAINING_TARGETS):
	$(KEEP_GOING)@$(MAKE) -f GNUmakefile.IORInterceptor_Idl $(@)
	$(KEEP_GOING)@$(MAKE) -f GNUmakefile.IORInterceptor $(@)

.PHONY: IORInterceptor_Idl
IORInterceptor_Idl:
	$(KEEP_GOING)@$(MAKE) -f GNUmakefile.IORInterceptor_Idl all

.PHONY: IORInterceptor
IORInterceptor: IORInterceptor_Idl
	$(KEEP_GOING)@$(MAKE) -f GNUmakefile.IORInterceptor all

project_name_list:
	@echo IORInterceptor
	@echo IORInterceptor_Idl
