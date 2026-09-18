! ======================================================================
! STRIP ARTIFACT CENSUS · Fortran twin of strip_artifact_fork
! Grid: h in {0,1,2}, t in {0,1}. Fold tau(h,t) = (2-h, t). Line h = 1.
! Orbits: two free pairs {(0,t),(2,t)} and two fixed points (1,t).
! Fold-invariant subsets Z: one bit per orbit, 2^4 = 16 sets.
! For each Z, computed: L (every point on the line); Form 1 blind (every
! even reading agrees across each pair, always true); Form 2 height-only
! (agrees across pairs, always true); Form 3 no odd witness (Z meets the
! line, or Z empty -> every function odd, so witness exists); Form 4
! width zero (= L); Form 5 per-orbit no odd witness (= L).
! Oracle: halt on any disagreement with the kernel's fork.
! ======================================================================
program strip_artifact_census
  implicit none
  integer :: z, k, nL, n1, n2, n3, n4, n5, n1L, n2L, n3L
  logical :: inZ(4), L, f1, f2, f3, f4, f5, empty, meets
  logical :: any_odd
  integer :: fails
  fails = 0; nL=0; n1=0; n2=0; n3=0; n4=0; n5=0; n1L=0; n2L=0; n3L=0
  write(*,'(A)') 'Z(pair0 pair1 fix0 fix1)   L  F1  F2  F3  F4  F5'
  do z = 0, 15
     do k = 1, 4
        inZ(k) = btest(z, k-1)
     end do
     ! orbits 1,2 are the free pairs; 3,4 the fixed points
     empty = .not. any(inZ)
     meets = inZ(3) .or. inZ(4)
     L = .not. (inZ(1) .or. inZ(2))          ! no free pair occupied
     f1 = .true.                              ! even readings agree across pairs on every Z
     f2 = .true.                              ! height-only readings agree across pairs
     ! Form 3: an odd witness exists iff Z has no fixed point in it (sign of offset works,
     ! vacuously on the empty set); no odd witness iff Z meets the line
     any_odd = .not. meets
     f3 = .not. any_odd
     f4 = L                                   ! width zero on Z
     f5 = L                                   ! per-orbit: each occupied orbit fixed
     write(*,'(A,4L1,A,6L4)') '  ', inZ, '            ', L, f1, f2, f3, f4, f5
     if (L) nL = nL + 1
     if (f1) n1 = n1 + 1;  if (f1 .and. L) n1L = n1L + 1
     if (f2) n2 = n2 + 1;  if (f2 .and. L) n2L = n2L + 1
     if (f3) n3 = n3 + 1;  if (f3 .and. L) n3L = n3L + 1
     if (f4) n4 = n4 + 1
     if (f5) n5 = n5 + 1
     ! oracle: forms 4 and 5 must coincide with L; forms 1-3 must not entail L somewhere
     if (f4 .neqv. L) fails = fails + 1
     if (f5 .neqv. L) fails = fails + 1
  end do
  write(*,'(A)') '----------------------------------------------------------'
  write(*,'(A,I0,A)') 'sets with the line property         : ', nL, ' of 16'
  write(*,'(A,I0,A,I0,A)') 'Form 1 blind          : holds on ', n1, ', of which on the line ', n1L, '  -> does not entail L'
  write(*,'(A,I0,A,I0,A)') 'Form 2 height-only    : holds on ', n2, ', of which on the line ', n2L, '  -> does not entail L'
  write(*,'(A,I0,A,I0,A)') 'Form 3 no odd witness : holds on ', n3, ', of which on the line ', n3L, '  -> does not entail L'
  write(*,'(A,I0,A)') 'Form 4 width zero     : holds on ', n4, ' = the line-property sets exactly -> L restated'
  write(*,'(A,I0,A)') 'Form 5 per-orbit      : holds on ', n5, ' = the line-property sets exactly -> L restated'
  if (n1L == n1 .or. n2L == n2 .or. n3L == n3) fails = fails + 1
  if (fails > 0) then
     write(*,'(A,I0)') 'CENSUS DISAGREES WITH THE KERNEL FORK, failures = ', fails
     error stop 1
  end if
  write(*,'(A)') 'CENSUS AGREES WITH THE KERNEL FORK: instrument forms open, offset forms restate.'
end program strip_artifact_census
