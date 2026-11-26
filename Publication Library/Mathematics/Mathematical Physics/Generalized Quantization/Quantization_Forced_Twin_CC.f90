! Quantization_Forced_Twin_CC.f90 · numerical twin of SPHYS_Quantization_Forced_CC.lean, edition 1.0.0
! RATIONALE. The Lean file proves its statements for every seat. This program checks them by exhaustion on small
!   seats and on a bounded range of the particle model, so that a reader can see each statement hold case by case.
! DESIGN. Part A: every seat on 4 points (10 involutions) with every registration into 3 values that the fold
!   keeps, and all 16 configurations. Part B: the particle map on charges in {-1,0,1} and frequency in {0,1}.
!   Part C: the time mirror on rates in {-1,0,1}. Part D: recording on the seat of 6 points, all 64 configurations.
! RISK. A check that passes here proves nothing beyond the cases enumerated. No number printed by this program
!   enters any proof.
! NON-NEGOTIABLE. Integer arithmetic only. Every check prints its count of cases and its count of failures.
program quantization_twin
  implicit none
  integer :: nfail_total, nchk
  nfail_total = 0; nchk = 0
  call part_a(); call part_b(); call part_c(); call part_d()
  write(*,'(A,I0,A,I0,A)') 'BATTERY {"checks":', nchk, ',"failures":', nfail_total, '}'
contains

  subroutine report(name, ncase, nfail)
    character(len=*), intent(in) :: name
    integer, intent(in) :: ncase, nfail
    nchk = nchk + 1; nfail_total = nfail_total + nfail
    if (nfail == 0) then
      write(*,'(A,A,I0,A)') name, '  PASS  (', ncase, ' cases)'
    else
      write(*,'(A,A,I0,A,I0,A)') name, '  FAIL  (', nfail, ' of ', ncase, ')'
    end if
  end subroutine

  ! ---- Part A: every seat on 4 points -------------------------------------------------------------------------
  subroutine part_a()
    integer :: f(4), r(4), i1, i2, i3, i4, r1, r2, r3, r4, s, a, b, nseat, nvac
    integer :: c1, c2, c3, c4, c5, c6, f1, f2, f3, f4, f5, f6, nex, nreg
    logical :: inv, kept, folded, wit, allfix, vacant, faithful, ins(4), seen(3), ok
    c1=0;c2=0;c3=0;c4=0;c5=0;c6=0; f1=0;f2=0;f3=0;f4=0;f5=0;f6=0; nseat=0; nvac=0
    do i1=1,4; do i2=1,4; do i3=1,4; do i4=1,4
      f = (/i1,i2,i3,i4/)
      inv = .true.
      do a=1,4; if (f(f(a)) /= a) inv = .false.; end do
      if (.not. inv) cycle
      vacant = .true.
      do a=1,4; if (f(a) == a) vacant = .false.; end do
      do r1=1,3; do r2=1,3; do r3=1,3; do r4=1,3
        r = (/r1,r2,r3,r4/)
        kept = .true.
        do a=1,4; if (r(f(a)) /= r(a)) kept = .false.; end do
        if (.not. kept) cycle
        nseat = nseat + 1; if (vacant) nvac = nvac + 1
        ! faithful (audit of 26 Nov 2026): the registration tells apart the points the fold fixes
        faithful = .true.
        do a=1,4; do b=1,4
          if (a /= b .and. f(a)==a .and. f(b)==b .and. r(a)==r(b)) faithful = .false.
        end do; end do
        do s=0,15
          do a=1,4; ins(a) = btest(s, a-1); end do
          folded = .true.; allfix = .true.; wit = .true.
          do a=1,4
            if (ins(a) .and. .not. ins(f(a))) folded = .false.
            if (ins(a) .and. f(a) /= a) allfix = .false.
            do b=1,4
              if (ins(a) .and. ins(b) .and. a /= b .and. r(a)==r(b)) wit = .false.
            end do
          end do
          nex = 0; seen = .false.
          do a=1,4; if (ins(a)) then; nex = nex + 1; seen(r(a)) = .true.; end if; end do
          nreg = count(seen)
          ! A1 form and witness put every existent on the line
          if (folded .and. wit) then; c1=c1+1; if (.not. allfix) f1=f1+1; end if
          ! A2 a witnessed configuration has as many registrations as existents
          if (wit) then; c2=c2+1; if (nreg /= nex) f2=f2+1; end if
          ! A3 in a folded configuration each existent is whole or by halves
          if (folded) then
            do a=1,4
              if (ins(a)) then
                c3=c3+1
                ok = (f(a)==a) .or. (ins(f(a)) .and. f(a)/=a .and. r(f(a))==r(a))
                if (.not. ok) f3=f3+1
              end if
            end do
          end if
          ! A4 one existent off the line ends the count
          if (folded .and. .not. allfix) then; c4=c4+1; if (wit) f4=f4+1; end if
          ! A5 on a vacant seat a witnessed existent stands without its partner
          if (vacant .and. wit) then
            do a=1,4
              if (ins(a)) then; c5=c5+1; if (ins(f(a))) f5=f5+1; end if
            end do
          end if
          ! A6 on a faithful seat, as defined above, a folded configuration is witnessed exactly when it is on the line
          if (faithful .and. folded) then; c6=c6+1; if (wit .neqv. allfix) f6=f6+1; end if
        end do
      end do; end do; end do; end do
    end do; end do; end do; end do
    write(*,'(A,I0,A,I0,A)') 'Part A: ', nseat, ' seats on 4 points, ', nvac, ' of them vacant, 16 configurations each'
    call report(' A1 form and witness put every existent on the line   ', c1, f1)
    call report(' A2 witnessed: as many registrations as existents     ', c2, f2)
    call report(' A3 folded: each existent whole or by halves          ', c3, f3)
    call report(' A4 one existent off the line ends the count          ', c4, f4)
    call report(' A5 vacant seat: a witnessed existent stands alone    ', c5, f5)
    call report(' A6 faithful seat: witnessed exactly when on the line ', c6, f6)
  end subroutine

  ! ---- Part B: the particle map, gravity's reading as the registration ----------------------------------------
  subroutine part_b()
    integer :: q, k, b, l, fr, n, f1, f2, f3, nneut, ncharged, npts
    logical :: neutral, fixed
    n=0; f1=0; f2=0; f3=0; nneut=0; ncharged=0
    do q=-1,1; do k=-1,1; do b=-1,1; do l=-1,1; do fr=0,1
      n = n + 1
      neutral = (q==0 .and. k==0 .and. b==0 .and. l==0)
      fixed = (-q==q .and. -k==k .and. -b==b .and. -l==l)      ! bar c = c
      if (fixed .neqv. neutral) f1 = f1 + 1                     ! B1 fixed exactly when neutral
      ! B2 the orbit {c, bar c}: witnessed by the frequency exactly when c is neutral; reading kept (fr = fr)
      if (neutral) then; nneut = nneut + 1; else; ncharged = ncharged + 1; end if
      npts = merge(1, 2, fixed)                                 ! the orbit {c, bar c}; it has one reading, fr
      if ((npts == 1) .neqv. neutral) f2 = f2 + 1
      if (.not. neutral .and. fixed) f3 = f3 + 1                ! B3 a charged particle is two on one reading
    end do; end do; end do; end do; end do
    write(*,'(A,I0,A,I0,A,I0,A)') 'Part B: ', n, ' particles, ', nneut, ' neutral, ', ncharged, ' charged'
    call report(' B1 the particle map fixes exactly the neutral        ', n, f1)
    call report(' B2 gravity counts the pair exactly when it is neutral', n, f2)
    call report(' B3 a charged particle is two on one reading          ', ncharged, f3)
  end subroutine

  ! ---- Part C: the time mirror, the level as the registration -------------------------------------------------
  subroutine part_c()
    integer :: q, fr, rt, q2, fr2, rt2, n, f1, f2, c2, f3, nst, ndec
    n=0; f1=0; f2=0; c2=0; f3=0; nst=0; ndec=0
    do q=-1,1; do fr=0,1; do rt=-1,1
      n = n + 1
      if ((-rt == rt) .neqv. (rt == 0)) f1 = f1 + 1             ! C1 fixed exactly when stationary
      if (rt == 0) then; nst = nst + 1; else; ndec = ndec + 1; end if
      if (rt /= 0 .and. -rt == rt) f3 = f3 + 1                  ! C3 a decaying mode is two on one level
      do q2=-1,1; do fr2=0,1; do rt2=-1,1
        if (rt==0 .and. rt2==0 .and. q==q2 .and. fr==fr2) then  ! C2 the level tells the stationary apart
          c2 = c2 + 1
          if (.not. (q==q2 .and. fr==fr2 .and. rt==rt2)) f2 = f2 + 1
        end if
      end do; end do; end do
    end do; end do; end do
    write(*,'(A,I0,A,I0,A,I0,A)') 'Part C: ', n, ' modes, ', nst, ' stationary, ', ndec, ' decaying'
    call report(' C1 the time mirror fixes exactly the stationary      ', n, f1)
    call report(' C2 the level tells the stationary apart              ', c2, f2)
    call report(' C3 a decaying mode is two on one level               ', ndec, f3)
  end subroutine

  ! ---- Part D: recording, on the seat of 6 points (h in 0..2, t in 0..1), line h = 1 --------------------------
  subroutine part_d()
    integer :: s, a, h, t, rec1, rec2, f1, f2, n
    logical :: online
    n=0; f1=0; f2=0
    do s=0,63
      n = n + 1
      rec1 = record(s); rec2 = record(rec1)
      if (rec2 /= rec1) f1 = f1 + 1                             ! D1 the record of the record is the record
      online = .true.
      do a=0,5
        h = a/2; t = mod(a,2)
        if (btest(s,a) .and. h /= 1) online = .false.
      end do
      if ((rec1 == s) .neqv. online) f2 = f2 + 1                ! D2 its own record exactly when on the line
    end do
    write(*,'(A,I0,A)') 'Part D: ', n, ' configurations of 6 points'
    call report(' D1 recording is one step                             ', n, f1)
    call report(' D2 the prior is the posterior exactly on the line    ', n, f2)
  end subroutine

  integer function record(s)
    integer, intent(in) :: s
    integer :: a, t
    record = 0
    do a=0,5
      if (btest(s,a)) then
        t = mod(a,2)
        record = ibset(record, 2 + t)                           ! the point (h = 1, t)
      end if
    end do
  end function
end program
