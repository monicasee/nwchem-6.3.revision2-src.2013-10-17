 LIB_DISTRIB = ../../../lib
 LIB_TARGETS = *.x *.p
      INCDIR = ../../../include
LIB_INCLUDES = -I$(INCDIR)

  export ARMCI_DIR_NAME := armci
ifeq ($(ARMCI_NETWORK),PORTALS)
  export ARMCI_DIR_NAME := armci-portals
endif

include ../../../$(ARMCI_DIR_NAME)/config/makecoms.h
include ../../../$(ARMCI_DIR_NAME)/config/makemp.h
include ../../../config/makefile.h

ifndef LIBDIR
   LIBDIR = $(LIB_DISTRIB)/$(TARGET)
endif

ifeq ($(MSG_COMMS), MPI)
  P_FILE = no
endif
ifdef USE_MPI
  P_FILE = no
endif

all: grp_sim.x

BINARIES = grp_sim.o cl_sim.o rdpar.o shuffle.o factor.o newcfg.o ran3.o\
           kin.o mdinit.o heapsort.o mdout.o sort.o force.o mdstep.o nextc.o\
           gather.o scatter.o update.o estats.o pairs.o tstats.o cell_list.o\
           cluster.o hash.o

%.x :  $(BINARIES) $(LIBDIR)/libglobal.a $(LIBDIR)/libarmci.a  $(EXTRA)
ifeq ($(P_FILE),YES)
	echo "`whoami` `hostname` 4 `pwd`/$@ /tmp" > $@.p
endif
	$(LINK.f) $(NOPT) $(FLDOPT) -o $@ $(BINARIES) $(LIBS) $(FLIBS);

%.p:
	echo "`whoami` `hostname` 4 `pwd`/$(basename $@) /tmp" > $@


.PHONY: clean
clean:
	-$(RM) -f *.o *.p *.exe *.obj *core *stamp *trace *.x *events*
	-$(RM) -rf ./obj

.PHONY: realclean
realclean:      clean
	-$(RM) -rf *~ \#*\#

.PHONY: cleanstamp
cleanstamp:
	-$(RM) -rf *.stamp
