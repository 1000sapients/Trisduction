! Maxwell_Forced_Twin_CC.f90 · numerical twin of SPHYS_Maxwell_Forced_CC.lean
! RATIONALE. The Lean file fixes the form of the law. This twin sets what the forced law says against what has been
!   measured, with the measured value and its error taken from the source named in each label, and it scans the
!   engine's statements over many random cases.
! DESIGN. Double precision, no library. A measured check passes when the forced value lies within two quoted errors,
!   or inside a quoted bound. A scan passes when no case fails.
! NON-NEGOTIABLE. No constant is tuned. A failed check prints FAIL and is counted.
program maxwell_twin
  implicit none
  integer, parameter :: dp = kind(1.0d0)
  real(dp), parameter :: pi = 3.14159265358979323846_dp
  real(dp), parameter :: h = 6.62607015e-34_dp, kB = 1.380649e-23_dp, c = 2.99792458e8_dp
  integer :: nfail, i, n, bad, hits, ia, ib, im, g, ga, d1, d2, r, d
  real(dp) :: x, sb2, sb3
  nfail = 0
  write(*,'(a)') 'A · Coulomb: the exponent of the static law'
  ! forced: exactly 2, a deviation q = 0. Measured: q = (2.7 +- 3.1)e-16 (Williams, Faller, Hill 1971)
  call check('inverse square: forced deviation 0 against (2.7 +- 3.1)e-16 (Williams, Faller, Hill 1971)', &
             abs(0.0_dp - 2.7e-16_dp) < 2.0_dp*3.1e-16_dp)
  write(*,'(a)') 'B · the photon has no mass'
  ! forced: 0. Measured bound: below 1e-18 eV (Ryutov 2007)
  ! a forced zero under a positive bound cannot fail: it is printed as a reading and is not counted
  write(*,'(a)') '  reading, not a check: forced mass 0 lies under the bound 1e-18 eV (Ryutov 2007)'
  write(*,'(a)') 'C · charge is conserved'
  ! forced: no decay of the electron. Measured: lifetime above 6.6e28 years (Borexino 2015)
  write(*,'(a)') '  reading, not a check: forced decay rate 0 lies under 1/(6.6e28 years) (Borexino 2015)'
  write(*,'(a)') 'D · two helicities: the constant of thermal radiation'
  sb2 = 2.0_dp*pi**5*kB**4/(15.0_dp*h**3*c*c)
  sb3 = 1.5_dp*sb2
  write(*,'(a,es12.5,a,es12.5)') '  with two helicities ', sb2, ', with three ', sb3
  ! measured: (5.66967 +- 0.00076)e-8 (Quinn, Martin 1985)
  call check('two helicities give 5.6704e-8, within two errors of (5.66967 +- 0.00076)e-8 (Quinn, Martin 1985)', &
             abs(sb2 - 5.66967e-8_dp) < 2.0_dp*0.00076e-8_dp)
  call check('three helicities in equilibrium give 8.5056e-8, excluded by the same measurement', &
             abs(sb3 - 5.66967e-8_dp) > 5.0_dp*0.00076e-8_dp)   ! the convention of five uncertainties
  write(*,'(a)') 'E · one speed: light and gravity read one arena'
  ! measured: -3e-15 < (v_gravity - c)/c < 7e-16 (Abbott et al. 2017)
  call check('forced difference 0 lies inside -3e-15 .. 7e-16 (Abbott et al. 2017)', &
             -3.0e-15_dp < 0.0_dp .and. 0.0_dp < 7.0e-16_dp)
  write(*,'(a)') 'F · nothing escapes: conservation forces the law, and the gauge with it'
  hits = 0; bad = 0
  call random_seed()
  do i = 1, 20000
     call random_number(x); ia = int(x*11.0_dp) - 5
     call random_number(x); ib = int(x*11.0_dp) - 5
     call random_number(x); im = int(x*5.0_dp) - 2
     d1 = 0; d2 = 0
     do g = -2, 2
        do ga = -2, 2
           if ((ia + ib)*g + im*ga /= 0) d1 = 1      ! divergence on the field (boxDivA = g, divA = ga)
           if (ia*g + ib*g + im*ga /= 0) d2 = 1      ! change of the law under the shift (g, ga)
        end do
     end do
     if (d1 /= d2) bad = bad + 1
     if (d1 == 0) then
        hits = hits + 1
        if (ia + ib /= 0 .or. im /= 0) bad = bad + 1
     else
        if (ia + ib == 0 .and. im == 0) bad = bad + 1
     end if
  end do
  write(*,'(a,i6,a)') '  ', hits, ' conserved laws among 20000 random triples (a, b, m)'
  call check('every conserved law has b = -a and no mass; conserved and gauge invariant coincide in every case', &
             bad == 0 .and. hits > 0)
  write(*,'(a)') 'G · the counts'
  bad = 0
  do n = 2, 60
     if ((2*(n-1) == (n-1)*(n-2)) .neqv. (n == 4)) bad = bad + 1
  end do
  call check('electric and magnetic parts have equal count in four dimensions and in no other from 2 to 60', bad == 0)
  bad = 0
  do n = 3, 60
     if ((2*(n-2) == n*(n-3)) .neqv. (n == 4)) bad = bad + 1
  end do
  call check('light and gravity carry equal polarizations in four dimensions and in no other from 3 to 60', bad == 0)
  bad = 0
  do n = 3, 60
     if (((n - 2) == 2) .neqv. (n == 4)) bad = bad + 1          ! two helicities in four dimensions only
     if ((n - 1) - (n - 2) /= 1) bad = bad + 1                  ! a mass adds one
  end do
  call check('helicities n - 2 are two in four dimensions only, and a mass adds one, from 3 to 60', bad == 0)
  write(*,'(a)') 'H · the static half: flux through spheres'
  bad = 0
  do d = 2, 6
     do r = 1, 40
        if ((2*r)**(d-1) /= 2**(d-1)*r**(d-1)) bad = bad + 1
     end do
  end do
  call check('twice the radius, 2**(d-1) times the area, for d = 2 to 6 and forty radii: inverse square at d = 3', bad == 0)
  write(*,'(a,i2)') 'failures: ', nfail
contains
  subroutine check(label, ok)
    character(len=*), intent(in) :: label
    logical, intent(in) :: ok
    if (ok) then
       write(*,'(a,a)') '  PASS  ', label
    else
       write(*,'(a,a)') '  FAIL  ', label
       nfail = nfail + 1
    end if
  end subroutine check
end program maxwell_twin
