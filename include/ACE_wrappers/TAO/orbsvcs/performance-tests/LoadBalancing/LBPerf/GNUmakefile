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

all: LoadBalancing_Performance_IDL LoadBalancing_Performance_Client LoadBalancing_Performance_Server

REMAINING_TARGETS := $(filter-out all,$(TARGETS_NESTED:.nested=)) $(CUSTOM_TARGETS)

$(REMAINING_TARGETS):
	$(KEEP_GOING)@cd RPS && $(MAKE) -f GNUmakefile.LoadBalancing_Performance_IDL $(@)
	$(KEEP_GOING)@cd RPS && $(MAKE) -f GNUmakefile.LoadBalancing_Performance_Client $(@)
	$(KEEP_GOING)@cd RPS && $(MAKE) -f GNUmakefile.LoadBalancing_Performance_Server $(@)

.PHONY: LoadBalancing_Performance_IDL
LoadBalancing_Performance_IDL:
	$(KEEP_GOING)@cd RPS && $(MAKE) -f GNUmakefile.LoadBalancing_Performance_IDL all

.PHONY: LoadBalancing_Performance_Client
LoadBalancing_Performance_Client: LoadBalancing_Performance_IDL
	$(KEEP_GOING)@cd RPS && $(MAKE) -f GNUmakefile.LoadBalancing_Performance_Client all

.PHONY: LoadBalancing_Performance_Server
LoadBalancing_Performance_Server: LoadBalancing_Performance_IDL LoadBalancing_Performance_Client
	$(KEEP_GOING)@cd RPS && $(MAKE) -f GNUmakefile.LoadBalancing_Performance_Server all

project_name_list:
	@echo LoadBalancing_Performance_Client
	@echo LoadBalancing_Performance_IDL
	@echo LoadBalancing_Performance_Server
