! THE HARDWARE OF THE CLOSURE, the executed twin. Hypercharge and isospin times six, integers.
! Build (sealed): gfortran -std=f2018 -O2 -fno-fast-math -ffp-contract=off Physical_Closure_Twin.f90
program physical_closure_twin
  implicit none
  integer, parameter :: dp = selected_real_kind(15, 307)
  real(dp), parameter :: G = 6.67430e-11_dp, MP = 1.67262192369e-27_dp, ME = 9.1093837015e-31_dp
  real(dp), parameter :: HBAR = 1.054571817e-34_dp, C = 299792458.0_dp, QE = 1.602176634e-19_dp
  real(dp), parameter :: EPS0 = 8.8541878128e-12_dp, ALPHA = 7.2973525693e-3_dp
  integer, parameter :: MULT(5) = [6, 3, 3, 2, 1], Y6(5) = [1, -4, 2, -3, 6]
  logical, parameter :: TRIP(5) = [.true., .true., .true., .false., .false.]
  logical, parameter :: DOUB(5) = [.true., .false., .false., .true., .false.]
  integer :: checks, fails, i, s1, s3, sc, sw, nd, cc, up, dn, el, st(4), cj(4)
  real(dp) :: alphag, coulomb_over_gravity, pi
  checks = 0; fails = 0; pi = acos(-1.0_dp)
  s1 = 0; s3 = 0; sc = 0; sw = 0; nd = 0; cc = 0
  do i = 1, 5
    s1 = s1 + MULT(i)*Y6(i)
    s3 = s3 + MULT(i)*Y6(i)**3
    if (TRIP(i)) sc = sc + (MULT(i)/3)*Y6(i)
    if (DOUB(i)) sw = sw + (MULT(i)/2)*Y6(i)
    if (DOUB(i)) nd = nd + MULT(i)/2
    if (TRIP(i)) cc = cc + merge(MULT(i)/3, -(MULT(i)/3), i == 1)
  end do
  call check('mixed gravitational anomaly: trace of hypercharge vanishes', s1 == 0)
  call check('cubic hypercharge anomaly vanishes', s3 == 0)
  call check('colour-hypercharge anomaly vanishes', sc == 0)
  call check('isospin-hypercharge anomaly vanishes', sw == 0)
  call check('Witten: an even number of doublets (4)', mod(nd, 2) == 0 .and. nd == 4)
  call check('colour cube: two triplets against two antitriplets', cc == 0)
  up = 3 + 1; dn = -3 + 1; el = -3 - 3
  call check('charges Q = T3 + Y: up 2/3, down -1/3, electron -1', up == 4 .and. dn == -2 .and. el == -6)
  call check('proton +1, neutron 0, hydrogen neutral exactly', up+up+dn == 6 .and. up+dn+dn == 0 .and. up+up+dn+el == 0)
  st = [0, 0, 0, 1]; cj = [-st(1), -st(2), -st(3), st(4)]
  call check('the sterile state sits on the fixed set; only gravity reads it', all(cj == st) .and. all(st(1:3) == 0))
  alphag = G*MP**2/(HBAR*C)
  coulomb_over_gravity = QE**2/(4.0_dp*pi*EPS0*G*MP*ME)
  write(*,'(a,es12.5)') '  gravitational coupling of the proton, G m_p^2/(hbar c): ', alphag
  write(*,'(a,es12.5)') '  its ratio to the fine-structure constant:              ', alphag/ALPHA
  write(*,'(a,es12.5)') '  Coulomb over gravity, electron and proton:             ', coulomb_over_gravity
  call check('the fourth is the weakest: G m_p^2/(hbar c) = 5.906e-39', abs(alphag/5.906e-39_dp - 1.0_dp) < 1.0e-3_dp)
  call check('Coulomb over gravity for hydrogen = 2.27e39', abs(coulomb_over_gravity/2.269e39_dp - 1.0_dp) < 2.0e-3_dp)
  write(*,'(a,i0,a,i0,a)') ' BATTERY-JSON: {"checks":', checks, ',"failures":', fails, '}'
  if (fails > 0) error stop 1
contains
  subroutine check(name, ok)
    character(*), intent(in) :: name
    logical, intent(in) :: ok
    checks = checks + 1
    if (.not. ok) fails = fails + 1
    write(*,'(a,a)') merge('  PASS  ','  FAIL  ',ok), name
  end subroutine check
end program physical_closure_twin
