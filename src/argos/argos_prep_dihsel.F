      logical function argos_prep_dihsel(catm,nparms,nparmsp,matm,natm,
     + ldih,mdih,ndih)
c
c $Id: argos_prep_dihsel.F 19708 2010-10-29 18:04:21Z d3y133 $
c
      implicit none
c
#include "argos_prep_common.fh"
c
      integer argos_prep_atnum
      external argos_prep_atnum
c
      integer matm,natm,mdih,ndih,nparms,nparmsp
      integer ldih(4,mdih)
      character*6 catm(nparmsp,matm)
c
      integer i,j,nd
c
      if(ffield(1:6).eq.'gromos') then
c
      nd=ndih
      ndih=0
      do 1 i=1,nd
      do 2 j=1,ndih
      if(ldih(2,i).eq.ldih(2,j).and.ldih(3,i).eq.ldih(3,j)) then
      if(argos_prep_atnum(catm(1,ldih(1,i)))+
     + argos_prep_atnum(catm(1,ldih(4,i))).lt.
     + argos_prep_atnum(catm(1,ldih(1,j)))+
     + argos_prep_atnum(catm(1,ldih(4,j)))) then
      ldih(2,i)=ldih(2,j)
      ldih(4,i)=ldih(4,j)
      endif
      goto 1
      endif
    2 continue
      ndih=ndih+1
      ldih(1,ndih)=ldih(1,i)
      ldih(2,ndih)=ldih(2,i)
      ldih(3,ndih)=ldih(3,i)
      ldih(4,ndih)=ldih(4,i)
    1 continue
      endif
c
      argos_prep_dihsel=.true.
c
      return
      end
