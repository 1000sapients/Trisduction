! Charge_Closure_Twin_CC.f90 · numerical twin of SPHYS_Charge_Closure_CC.lean
! RATIONALE. The engine proves that the four closure conditions of a generation leave three cases, that a total can
!   hide a failure while a threshold cannot, and that a label the registration conserves is read. This twin finds
!   every solution in a box by search (A, B), scans the threshold statements (C), scans labels (D) and sets two
!   consequences against measurement (E).
! DESIGN. Integers, no library. Hypercharges are carried times 6, as in the engine: the observed table is
!   (q, u, d, l, e) = (1, 4, -2, -3, -6). The sums are those of the engine, left minus right, with the multiplicities
!   3 colours times 2 for the quark doublet, 2 for the lepton doublet, 3 for each right-handed quark, 1 for the
!   right-handed electron. The search of A runs over all 25**5 tables with charges from -12 to 12.
!   Electric charge is hypercharge plus the weak part, so times 6: up 4, down -2, electron -6, neutrino 0.
!   Measured inputs of E: the charge of the neutron, (-0.2 +- 0.8)e-21 of the electron's (the average of Navas et al. 2024);
!   the sum of the charges of the proton and the electron, below 1e-21 of the electron's (Bressi et al. 2011);
!   A reading, not a check: the number of light neutrinos, 2.9963 +- 0.0074 (Janot and Jadach 2020).
! RISK. A search of a box is not a proof outside the box; the classification for all integers is the engine's theorem.
! NON-NEGOTIABLE. The counts printed by A and B are found by the search, not entered.
program charge_twin
  implicit none
  integer, parameter :: dp = kind(1.0d0), B = 12
  integer :: nfail, npass, q, u, d, l, e, nsol, nzero, nobs, nswap, nother, a, bb, c, nhide, cnt
  logical :: ok, ok2
  nfail = 0; npass = 0

  ! A. every table in the box that satisfies the four conditions
  nsol = 0; nzero = 0; nobs = 0; nswap = 0; nother = 0
  do q = -B, B
    do l = -B, B
      if (a2(q, l) /= 0) cycle
      do u = -B, B
        do d = -B, B
          if (a3(q, u, d) /= 0) cycle
          do e = -B, B
            if (ag(q, u, d, l, e) /= 0) cycle
            if (a1(q, u, d, l, e) /= 0) cycle
            nsol = nsol + 1
            if (q == 0 .and. l == 0 .and. e == 0 .and. d == -u) then
              nzero = nzero + 1
            else if (q /= 0 .and. u == 4*q .and. d == -2*q .and. l == -3*q .and. e == -6*q) then
              nobs = nobs + 1
            else if (q /= 0 .and. u == -2*q .and. d == 4*q .and. l == -3*q .and. e == -6*q) then
              nswap = nswap + 1
            else
              nother = nother + 1
            end if
          end do
        end do
      end do
    end do
  end do
  write(*,'(a,i0)') '  tables searched: 25**5 = ', 25**5
  write(*,'(a,i0,a,i0,a,i0,a,i0)') '  tables that close: ', nsol, '; doublets without hypercharge: ', nzero, &
        '; the observed table at some scale: ', nobs, '; the same with the right-handed quarks renamed: ', nswap
  call check('A1 every table in the box that closes is one of the three cases of the engine', nother == 0 .and. nsol > 0)
  call check('A2 the observed table closes at every scale the box holds, and so does the renamed one', nobs == 4 .and. nswap == 4)

  ! B. a total can hide a failure: pairs of lepton charges that each fail the first condition and close together
  nhide = 0
  do a = -B, B
    do bb = -B, B
      if (a2(1, a) /= 0 .and. a2(1, bb) /= 0 .and. a2(1, a) + a2(1, bb) == 0) nhide = nhide + 1
    end do
  end do
  write(*,'(a,i0)') '  pairs of generations that fail singly and close in total: ', nhide
  call check('B  there are pairs of generations that each fail a condition while their total satisfies it', nhide > 0)

  ! C. a threshold cannot: values of a sum in three generations, each from -6 to 6
  ok = .true.; cnt = 0
  do a = -6, 6
    do bb = -6, 6
      do c = -6, 6
        if (a == 0 .and. a + bb == 0 .and. a + bb + c == 0) then
          cnt = cnt + 1
          if (.not. (bb == 0 .and. c == 0)) ok = .false.
        end if
      end do
    end do
  end do
  write(*,'(a,i0,a,i0)') '  triples tried: ', 13**3, '; triples that close at every threshold: ', cnt
  call check('C  a sum that closes with one, with two and with three generations closes in each', ok .and. cnt == 1)

  ! D. labels on states (x, y), x and y from -4 to 6: conserved by the registration exactly when blind to x
  ok = .true.; ok2 = .true.
  do a = 1, 5
    if (conserved(a) .neqv. (a == 1 .or. a == 4)) ok = .false.      ! labels 1 and 4 do not read x
    if (conserved(a) .and. .not. foldblind(a)) ok2 = .false.
  end do
  call check('D1 of five labels, the registration conserves exactly the two that do not read the side', ok)
  call check('D2 every conserved label gives a state and its fold partner one value', ok2)
  call check('D3 the label (x - 1)**2 gives fold partners one value and is still not conserved', &
             foldblind(5) .and. .not. conserved(5))

  ! E. measured
  u = 4; d = -2; e = -6
  write(*,'(a,i0,a,i0,a,i0)') '  charges times 6 on the forced table: proton ', 2*u + d, ', neutron ', u + 2*d, ', electron ', e
  call check('E1 the neutron of the forced table is neutral: measured (-0.2 +- 0.8)e-21 (Navas et al. 2024)', &
             abs(real(u + 2*d, dp)/6.0_dp - (-0.2e-21_dp)) < 2.0_dp*0.8e-21_dp)
  call check('E2 the proton and the electron of the forced table cancel: measured below 1e-21 (Bressi et al. 2011)', &
             abs(real(2*u + d + e, dp)/6.0_dp) < 1.0e-21_dp)
  write(*,'(a)') '  reading: the number of light neutrinos is 2.9963 +- 0.0074 (Janot and Jadach 2020); the count three is an input'

  write(*,'(a,i0,a,i0)') 'checks passed: ', npass, '   failures: ', nfail
contains
  integer function a2(qq, ll)
    integer, intent(in) :: qq, ll
    a2 = 3*qq + ll
  end function
  integer function a3(qq, uu, dd)
    integer, intent(in) :: qq, uu, dd
    a3 = 6*qq - (3*uu + 3*dd)
  end function
  integer function ag(qq, uu, dd, ll, ee)
    integer, intent(in) :: qq, uu, dd, ll, ee
    ag = (6*qq + 2*ll) - (3*uu + 3*dd + ee)
  end function
  integer function a1(qq, uu, dd, ll, ee)
    integer, intent(in) :: qq, uu, dd, ll, ee
    a1 = (6*qq**3 + 2*ll**3) - (3*uu**3 + 3*dd**3 + ee**3)
  end function
  integer function label(n, x, y)
    integer, intent(in) :: n, x, y
    select case (n)
    case (1); label = y
    case (2); label = x
    case (3); label = x + y
    case (4); label = y*y - 3*y
    case default; label = (x - 1)**2
    end select
  end function
  logical function conserved(n)      ! label(reg p) = label(p) at every state of the grid; reg sets x to 1
    integer, intent(in) :: n
    integer :: x, y
    conserved = .true.
    do x = -4, 6
      do y = -4, 6
        if (label(n, 1, y) /= label(n, x, y)) conserved = .false.
      end do
    end do
  end function
  logical function foldblind(n)      ! label(fold p) = label(p); fold sends x to 2 - x
    integer, intent(in) :: n
    integer :: x, y
    foldblind = .true.
    do x = -4, 6
      do y = -4, 6
        if (label(n, 2 - x, y) /= label(n, x, y)) foldblind = .false.
      end do
    end do
  end function
  subroutine check(name, cond)
    character(*), intent(in) :: name
    logical, intent(in) :: cond
    if (cond) then
      write(*,'(a,a)') '  PASS  ', name; npass = npass + 1
    else
      write(*,'(a,a)') '  FAIL  ', name; nfail = nfail + 1
    end if
  end subroutine
end program charge_twin
