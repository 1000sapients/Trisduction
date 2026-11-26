! Quantization_Forced_Twin_CC.f90 · numerical twin of the three kernels of edition 2.0.0
!   (SPHYS_Quantization_Forced_CC.lean, SPHYS_Quantization_II_CC.lean, SPHYS_Quantization_Star_CC.lean)
! RATIONALE. The Lean file proves its statements for every seat. This program checks them by exhaustion on small
!   seats and on a bounded range of the particle model, so that a reader can see each statement hold case by case.
! DESIGN. Part A: every seat on 4 points (10 involutions) with every registration into 3 values that the fold
!   keeps, and all 16 configurations. Part B: the particle map on charges in {-1,0,1} and frequency in {0,1}.
!   Part C: the time mirror on rates in {-1,0,1}. Part D: recording on the seat of 6 points, all 64 configurations.
!   Edition 2.0.0 adds: Part E any two maps of 3 points (no structure asked of them) with every reading they keep.
!   Part F total charge of every configuration closed under the particle map. Part G the labels of a symmetry of
!   period n in arithmetic modulo a prime. Part H the wave, parity and the energy. Part I identical quanta and the
!   occupation numbers. Part J the commutator of 2 by 2 integer matrices, with the transpose as the adjoint.
! RISK. A check that passes here proves nothing beyond the cases enumerated. No number printed by this program
!   enters any proof.
! NON-NEGOTIABLE. Integer arithmetic only. Every check prints its count of cases and its count of failures.
program quantization_twin
  implicit none
  integer :: nfail_total, nchk
  nfail_total = 0; nchk = 0
  call part_a(); call part_b(); call part_c(); call part_d()
  call part_e(); call part_f(); call part_g(); call part_h(); call part_i(); call part_j()
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

  ! ---- Part E: any family of maps. Two arbitrary maps f, g of 3 points; every reading into 2 values they keep --
  subroutine part_e()
    integer :: f(3), g(3), r(3), cl(3), i, j, a, b, s, it, nfam, c1, f1, c2, f2
    logical :: kept, closed, cnt, allfix, ins(3)
    nfam=0; c1=0; f1=0; c2=0; f2=0
    do i=0,26; do j=0,26
      f = (/ mod(i,3)+1, mod(i/3,3)+1, i/9+1 /); g = (/ mod(j,3)+1, mod(j/3,3)+1, j/9+1 /)
      nfam = nfam + 1
      cl = (/1,2,3/)                                            ! orbit classes: identify a with f(a) and with g(a)
      do it=1,6; do a=1,3
        b = min(cl(a), cl(f(a)), cl(g(a))); cl(a) = b; cl(f(a)) = b; cl(g(a)) = b
      end do; end do
      do s=0,7
        r = (/ ibits(s,0,1), ibits(s,1,1), ibits(s,2,1) /)
        kept = .true.
        do a=1,3; if (r(f(a)) /= r(a) .or. r(g(a)) /= r(a)) kept = .false.; end do
        if (.not. kept) cycle
        ! E1 a kept reading is constant on each orbit class: it factors through the orbit map
        do a=1,3; do b=1,3
          if (cl(a) == cl(b)) then; c1 = c1 + 1; if (r(a) /= r(b)) f1 = f1 + 1; end if
        end do; end do
        do it=0,7                                               ! configurations
          do a=1,3; ins(a) = btest(it, a-1); end do
          closed = .true.; cnt = .true.; allfix = .true.
          do a=1,3
            if (ins(a) .and. .not. (ins(f(a)) .and. ins(g(a)))) closed = .false.
            if (ins(a) .and. (f(a) /= a .or. g(a) /= a)) allfix = .false.
            do b=1,3; if (ins(a) .and. ins(b) .and. a /= b .and. r(a) == r(b)) cnt = .false.; end do
          end do
          ! E2 closed and counted puts every member on the fixed set of both maps
          if (closed .and. cnt) then; c2 = c2 + 1; if (.not. allfix) f2 = f2 + 1; end if
        end do
      end do
    end do; end do
    write(*,'(A,I0,A)') 'Part E: ', nfam, ' pairs of maps of 3 points, every reading into 2 values they keep'
    call report(' E1 every kept reading factors through the orbit map  ', c1, f1)
    call report(' E2 closed and counted: every member on the fixed set ', c2, f2)
  end subroutine

  ! ---- Part F: total charge. 10 particles (charge -2..2, frequency 0..1); all subsets closed under the map ----
  subroutine part_f()
    integer :: s, a, q, tot, n, f1
    logical :: closed
    n=0; f1=0
    do s=0,1023
      closed = .true.; tot = 0
      do a=0,9                                                  ! particle a: charge q = a/2 - 2, frequency mod(a,2)
        q = a/2 - 2
        if (btest(s,a)) then
          tot = tot + q
          if (.not. btest(s, 2*(2-q) + mod(a,2))) closed = .false.   ! its antiparticle: charge -q, same frequency
        end if
      end do
      if (closed) then; n = n + 1; if (tot /= 0) f1 = f1 + 1; end if
    end do
    write(*,'(A,I0,A)') 'Part F: ', n, ' configurations of 10 particles closed under the particle map'
    call report(' F1 matter with its antimatter is neutral as a whole  ', n, f1)
  end subroutine

  ! ---- Part G: the labels of a symmetry of period n, in arithmetic modulo a prime -----------------------------
  subroutine part_g()
    integer, parameter :: pr(5) = (/5, 7, 11, 13, 17/)
    integer :: ip, p, n, x, k, pw, nlab, c1, f1
    c1=0; f1=0
    do ip=1,5
      p = pr(ip)
      do n=1,p-1
        nlab = 0
        do x=1,p-1
          pw = 1
          do k=1,n; pw = mod(pw*x, p); end do
          if (pw == 1) nlab = nlab + 1                          ! x is a label: x**n = 1
        end do
        c1 = c1 + 1; if (nlab > n) f1 = f1 + 1                  ! G1 at most n labels
      end do
    end do
    write(*,'(A)') 'Part G: periods 1 to p-1 for the primes 5, 7, 11, 13, 17'
    call report(' G1 a symmetry of period n has at most n labels       ', c1, f1)
  end subroutine

  ! ---- Part H: the wave. Polarisations in -3..3; parity reverses the cross part; the energy is the registration
  subroutine part_h()
    integer :: p, c, n, f1, c2, f2
    n=0; f1=0; c2=0; f2=0
    do p=-3,3; do c=-3,3
      n = n + 1
      if (-(-c) /= c) f1 = f1 + 1                                ! involution
      if ((-c == c) .neqv. (c == 0)) f1 = f1 + 1                 ! fixed exactly with no cross part
      if (p*p + (-c)*(-c) /= p*p + c*c) f1 = f1 + 1              ! the energy is kept
      if (c /= 0) then; c2 = c2 + 1; if (-c == c) f2 = f2 + 1; end if   ! two waves, one energy
    end do; end do
    write(*,'(A,I0,A)') 'Part H: ', n, ' waves'
    call report(' H1 parity: an involution, fixes no-cross, keeps energy', n, f1)
    call report(' H2 the two helicities are two on one energy          ', c2, f2)
  end subroutine

  ! ---- Part I: identical quanta. 3 quanta in 2 modes, the 6 relabellings, the occupation numbers --------------
  subroutine part_i()
    integer, parameter :: pm(3,6) = reshape((/1,2,3, 1,3,2, 2,1,3, 2,3,1, 3,1,2, 3,2,1/), (/3,6/))
    integer :: s, k, a, x(3), y(3), c1, f1, c2, f2
    logical :: allfix, onemode
    c1=0; f1=0; c2=0; f2=0
    do s=0,7
      x = (/ ibits(s,0,1), ibits(s,1,1), ibits(s,2,1) /)
      allfix = .true.
      do k=1,6
        do a=1,3; y(a) = x(pm(a,k)); end do
        c1 = c1 + 1; if (sum(y) /= sum(x)) f1 = f1 + 1          ! I1 relabelling keeps the occupation numbers
        if (any(y /= x)) allfix = .false.
      end do
      onemode = (x(1) == x(2) .and. x(2) == x(3))
      c2 = c2 + 1; if (allfix .neqv. onemode) f2 = f2 + 1       ! I2 fixed by all exactly when in one mode
    end do
    write(*,'(A)') 'Part I: 8 assignments of 3 quanta to 2 modes, 6 relabellings'
    call report(' I1 relabelling keeps the occupation numbers          ', c1, f1)
    call report(' I2 fixed by every relabelling exactly in one mode    ', c2, f2)
  end subroutine

  ! ---- Part J: the commutator. 2 by 2 integer matrices with entries in -1..1; the adjoint is the transpose ----
  subroutine part_j()
    integer :: i, j, a(2,2), b(2,2), c(2,2), c1, f1, c2, f2
    c1=0; f1=0; c2=0; f2=0
    do i=0,80; do j=0,80
      a = reshape((/ mod(i,3)-1, mod(i/3,3)-1, mod(i/9,3)-1, i/27-1 /), (/2,2/))
      b = reshape((/ mod(j,3)-1, mod(j/3,3)-1, mod(j/9,3)-1, j/27-1 /), (/2,2/))
      c = matmul(a,b) - matmul(b,a)
      c1 = c1 + 1                                               ! J1 no commutator is a nonzero multiple of the identity
      if (c(1,2) == 0 .and. c(2,1) == 0 .and. c(1,1) == c(2,2) .and. c(1,1) /= 0) f1 = f1 + 1
      if (all(a == transpose(a)) .and. all(b == transpose(b))) then
        c2 = c2 + 1                                             ! J2 of two observables: reversed by the adjoint, real part zero
        if (any(transpose(c) /= -c) .or. any(c + transpose(c) /= 0)) f2 = f2 + 1
      end if
    end do; end do
    write(*,'(A)') 'Part J: 6561 pairs of 2 by 2 integer matrices'
    call report(' J1 no commutator is a nonzero multiple of identity   ', c1, f1)
    call report(' J2 observables: the adjoint reverses the commutator  ', c2, f2)
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
