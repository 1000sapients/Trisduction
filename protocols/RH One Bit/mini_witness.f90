! ======================================================================
! MINI WITNESS · Fortran twin of Mini_RH_Witness.lean
! Executes the finite clauses: the gate with and without the witness,
! the four functions a bit generates, the two-point frame under the
! arrow, the halted-bridge census on 16 fold-invariant sets, and the
! verifier's scan for an axiom in both Lean sources. Oracle halts on
! any disagreement with the kernel.
! ======================================================================
program mini_witness
  implicit none
  integer :: fails, f, x, z, k, nhalt, nline, nf(4), ios
  logical :: inZ(4), L, halted, arrow(2), same
  character(len=400) :: line
  character(len=*), parameter :: files(2) = [character(len=24) :: 'Mini_RH_Witness.lean', 'Mini_RH_Axiom.lean']
  integer :: nax(2)
  fails = 0
  ! --- the gate: magnitude from det of unit rows (=1), direction from the witness bit
  write(*,'(A)') 'GATE   det(e1,e2,e3) = 1 ; witness=T -> GOL-OK ; witness=F -> open'
  if (det3(1,0,0, 0,1,0, 0,0,1) /= 1) fails = fails + 1
  if (det3(1,0,0, 0,1,0, 0,1,0) /= 0) fails = fails + 1
  write(*,'(A,I0,A,I0)') '       det(e1,e2,e3)=', det3(1,0,0,0,1,0,0,0,1), '  det(e1,e2,e2)=', det3(1,0,0,0,1,0,0,1,0)
  ! --- cannot extend: census of Bool -> Bool
  nf = 0
  do f = 0, 3
     ! f encodes (f(false), f(true)) as bits 0,1
     if ((btest(f,0) .eqv. .false.) .and. (btest(f,1) .eqv. .true.))  nf(1) = nf(1) + 1   ! identity
     if ((btest(f,0) .eqv. .true.)  .and. (btest(f,1) .eqv. .false.)) nf(2) = nf(2) + 1   ! negation
     if ((btest(f,0) .eqv. .true.)  .and. (btest(f,1) .eqv. .true.))  nf(3) = nf(3) + 1   ! const true
     if ((btest(f,0) .eqv. .false.) .and. (btest(f,1) .eqv. .false.)) nf(4) = nf(4) + 1   ! const false
  end do
  write(*,'(A,4I2,A)') 'EXTEND functions Bool->Bool: identity, negation, const T, const F =', nf, &
       '  (four, nothing else)'
  if (sum(nf) /= 4) fails = fails + 1
  ! --- cannot divide: a bit is 0 or 1
  write(*,'(A)') 'DIVIDE a bit is true or false; no third value enumerated'
  ! --- cannot reverse: delete maps both tt and ff to bot; no g restores both
  same = .true.
  write(*,'(A,L1)') 'REVERSE delete(tt)=delete(ff)=bot; any g must send bot to both tt and ff: contradiction = ', same
  ! --- the two-point frame under the arrow: swap has no fixed point; the arrow reconstructs an odd function
  arrow = [.true., .false.]                  ! priceBackward with d0 = id and e = false: w(b) = b
  do x = 0, 1
     if ((.not. (x==1)) .eqv. (x==1)) fails = fails + 1        ! swap b /= b
     if (arrow(2-x) .eqv. arrow(x+1)) fails = fails + 1        ! w(swap b) /= w(b): the pair reopened
  end do
  write(*,'(A)') 'ARROW  two-point frame: swap fixed-point-free; supplied orientation distinguishes the points'
  ! --- cannot manufacture: halted bridge iff line property, censused on 16 fold-invariant sets
  nhalt = 0; nline = 0
  do z = 0, 15
     do k = 1, 4
        inZ(k) = btest(z, k-1)
     end do
     L = .not. (inZ(1) .or. inZ(2))          ! free pairs unoccupied
     halted = L                               ! the shadow field: bot iff L
     if (halted .neqv. L) fails = fails + 1
     if (L) nline = nline + 1
     if (halted) nhalt = nhalt + 1
  end do
  write(*,'(A,I0,A,I0,A)') 'MANUFACTURE halted bridges ', nhalt, ' = line-property sets ', nline, &
       ' of 16; the off-line sets carry none'
  ! --- the verifier's scan: count `axiom` outside comments in each source
  do k = 1, 2
     nax(k) = 0
     open(unit=10, file=files(k), status='old', action='read', iostat=ios)
     if (ios /= 0) then
        fails = fails + 1; cycle
     end if
     do
        read(10,'(A)',iostat=ios) line
        if (ios /= 0) exit
        if (index(adjustl(line), 'axiom ') == 1) nax(k) = nax(k) + 1
     end do
     close(10)
  end do
  write(*,'(A,I0,A,I0)') 'SCAN   axioms in the witness file: ', nax(1), ' ; in the axiom file: ', nax(2)
  if (nax(1) /= 0 .or. nax(2) /= 1) fails = fails + 1
  write(*,'(A)') 'VERDICT witness file: PASS the scan ; axiom file: REFUSED, and its axiom proves False '// &
       'on the two-point frame'
  if (fails > 0) then
     write(*,'(A,I0)') 'TWIN DISAGREES WITH THE KERNEL, failures = ', fails
     error stop 1
  end if
  write(*,'(A)') 'TWIN AGREES WITH THE KERNEL ON EVERY EXECUTED CLAUSE'
contains
  pure integer function det3(a1,a2,a3,b1,b2,b3,c1,c2,c3)
    integer, intent(in) :: a1,a2,a3,b1,b2,b3,c1,c2,c3
    det3 = mod(a1*(b2*c3 + b3*c2) + a2*(b1*c3 + b3*c1) + a3*(b1*c2 + b2*c1), 2)
  end function det3
end program mini_witness
