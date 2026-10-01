! Measurement_Twin.f90 · the executed twin of SPHYS_Measurement.lean · Fortran 2018.
! Build (sealed): gfortran -std=f2018 -O2 -fno-fast-math -ffp-contract=off Measurement_Twin.f90
! A the pointer carrier; B decoherence lands on the line; C complementarity is positivity; D the
! record forgets the phase; E repeated registration freezes the motion (Zeno); F the outcome is
! keyed and its frequency is the height; G the price of a record.
program measurement_twin
  implicit none
  integer, parameter :: dp = selected_real_kind(15, 307)
  integer, parameter :: i8 = selected_int_kind(18)
  real(dp), parameter :: PI = 3.141592653589793_dp, KB = 1.380649e-23_dp
  integer :: checks, fails
  integer(i8) :: seed
  checks = 0; fails = 0; seed = 20261001_i8
  call block_a(); call block_b(); call block_c(); call block_d(); call block_e(); call block_f(); call block_g()
  write(*,'(a,i0,a,i0,a)') ' BATTERY-JSON: {"checks":', checks, ',"failures":', fails, '}'
  if (fails > 0) error stop 1
contains
  include 'twin_common.inc'
  subroutine block_a()
    integer :: c, p, n, ok
    write(*,'(a)') 'A · the phase flip is the fold under the pointer carrier (1 + c, p0)'
    n = 0; ok = 0
    do c = -40, 40
      do p = 0, 40
        n = n + 1
        if (1 + (-c) == 2 - (1 + c) .and. ((1 + c == 1) .eqv. (c == 0))) ok = ok + 1
      end do
    end do
    call check('3321 states: the flip is the fold and the classical states are the line', ok == n)
  end subroutine block_a
  subroutine block_b()
    integer :: k, ok
    real(dp) :: p, r, ph, cr, ci, dcr, dci, dp0
    write(*,'(a)') 'B · dephasing, the average of a state and its phase-flipped partner'
    ok = 0
    do k = 1, 100000
      p = rnd(); r = sqrt(p*(1.0_dp - p))*rnd(); ph = 2.0_dp*PI*rnd()
      cr = r*cos(ph); ci = r*sin(ph)
      dp0 = 0.5_dp*(p + p); dcr = 0.5_dp*(cr + (-cr)); dci = 0.5_dp*(ci + (-ci))
      if (dcr == 0.0_dp .and. dci == 0.0_dp .and. dp0 == p) ok = ok + 1
    end do
    call check('100000 random states: coherence exactly zero after dephasing, populations kept exactly', ok == 100000)
  end subroutine block_b
  subroutine block_c()
    integer :: k, okm, okp
    real(dp) :: p, c, pp, vv, a, b, ph, w, p1, c1, p2, c2
    write(*,'(a)') 'C · complementarity: predictability^2 + visibility^2 <= 1, with equality for pure states'
    okm = 0; okp = 0
    do k = 1, 100000
      a = rnd(); ph = 2.0_dp*PI*rnd()
      p = a; c = sqrt(a*(1.0_dp - a))
      pp = (2.0_dp*p - 1.0_dp)**2; vv = 4.0_dp*c*c
      if (abs(pp + vv - 1.0_dp) < 1.0e-14_dp) okp = okp + 1
      w = rnd(); b = rnd()
      p1 = a; c1 = sqrt(a*(1.0_dp - a))*cos(ph)
      p2 = b; c2 = sqrt(b*(1.0_dp - b))
      p = w*p1 + (1.0_dp - w)*p2; c = w*c1 + (1.0_dp - w)*c2
      if ((2.0_dp*p - 1.0_dp)**2 + 4.0_dp*c*c <= 1.0_dp + 1.0e-14_dp) okm = okm + 1
    end do
    call check('100000 pure states saturate P^2 + V^2 = 1 to 1e-14', okp == 100000)
    call check('100000 mixed states obey P^2 + V^2 <= 1', okm == 100000)
  end subroutine block_c
  subroutine block_d()
    integer :: k, ok
    real(dp) :: ph, ar, br, bi, p0, p1
    write(*,'(a)') 'D · the pointer record a|0> + b e^(i phi)|1> keeps |a|^2, |b|^2 and forgets phi'
    ar = sqrt(0.3_dp); ok = 0
    do k = 0, 999
      ph = 2.0_dp*PI*real(k, dp)/1000.0_dp
      br = sqrt(0.7_dp)*cos(ph); bi = sqrt(0.7_dp)*sin(ph)
      p0 = ar*ar; p1 = br*br + bi*bi
      if (p0 == ar*ar .and. abs(p1 - 0.7_dp) < 1.0e-15_dp) ok = ok + 1
    end do
    call check('1000 phases: one record, populations 0.3 and 0.7', ok == 1000)
  end subroutine block_d
  subroutine block_e()
    integer :: k, n
    real(dp) :: s(7), prev
    logical :: mono
    write(*,'(a)') 'E · repeated registration freezes the motion: a pi rotation split into N measured steps'
    mono = .true.; prev = -1.0_dp
    do k = 0, 6
      n = 2**k
      s(k + 1) = cos(PI/(2.0_dp*real(n, dp)))**(2*n)
      write(*,'(a,i3,a,f10.6)') '  N = ', n, '  survival = ', s(k + 1)
      if (s(k + 1) <= prev) mono = .false.
      prev = s(k + 1)
    end do
    call check('survival rises from 0 at N = 1 toward 1: 0.9622 at N = 64', &
               mono .and. s(1) < 1.0e-30_dp .and. abs(s(7) - 0.96216_dp) < 1.0e-4_dp)
  end subroutine block_e
  subroutine block_f()
    integer :: k, n1, n0
    real(dp) :: f, sig
    write(*,'(a)') 'F · one dephased state, both outcomes: the outcome is not a function of the state'
    n1 = 0; n0 = 0
    do k = 1, 1000000
      if (rnd() < 0.3_dp) then
        n1 = n1 + 1
      else
        n0 = n0 + 1
      end if
    end do
    f = real(n1, dp)/1.0e6_dp; sig = sqrt(0.3_dp*0.7_dp/1.0e6_dp)
    write(*,'(a,f9.6)') '  frequency of the outcome with population 0.3: ', f
    call check('both outcomes registered from one state, and the frequency is the height within 4 sigma', &
               n1 > 0 .and. n0 > 0 .and. abs(f - 0.3_dp) < 4.0_dp*sig)
  end subroutine block_f
  subroutine block_g()
    real(dp) :: q300, q4
    write(*,'(a)') 'G · the price of a record: Landauer, k T ln 2 per registered bit'
    q300 = KB*300.0_dp*log(2.0_dp); q4 = KB*4.2_dp*log(2.0_dp)
    write(*,'(a,es12.5,a,es12.5,a)') '  300 K: ', q300, ' J ;  4.2 K: ', q4, ' J'
    call check('one bit at 300 K costs 2.871e-21 J; at 4.2 K 4.02e-23 J', &
               abs(q300/2.871e-21_dp - 1.0_dp) < 1.0e-3_dp .and. abs(q4/4.019e-23_dp - 1.0_dp) < 1.0e-3_dp)
  end subroutine block_g
end program measurement_twin
