! Proton_Twin.f90 · twin of "The Proton Is the Lock" · Fortran 2018.
! The color singlet as the determinant, invariant under a random SU(3) matrix built here;
! the lock failing when two colors coincide; the mass carried by the field; the spin record.
program proton_twin
  implicit none
  integer, parameter :: dp = selected_real_kind(15, 307)
  real(dp), parameter :: MP = 938.27208816_dp, MU = 2.16_dp, MD = 4.67_dp     ! MeV: CODATA 2018; PDG 2022
  real(dp), parameter :: MPI = 139.57039_dp, MGLUE = 1730.0_dp               ! MeV: PDG; Morningstar-Peardon 1999
  real(dp), parameter :: SIGMA = 0.30_dp                                      ! quark spin fraction, EMC 1988 and successors
  real(dp), parameter :: TAUP = 2.4e34_dp, AGE = 1.38e10_dp                   ! yr: Super-K 2020 (p -> e+ pi0); cosmic age
  complex(dp) :: u(3,3), z(3,3), d, t
  real(dp) :: eps(3,3,3), err, frac, maxdev
  integer :: i, j, k, a, b, c, nchk, nfail, nz
  integer(8) :: seed
  nchk = 0; nfail = 0; eps = 0.0_dp
  eps(1,2,3) = 1; eps(2,3,1) = 1; eps(3,1,2) = 1; eps(1,3,2) = -1; eps(3,2,1) = -1; eps(2,1,3) = -1
  nz = count(abs(eps) > 0.5_dp)
  call check('the singlet has six nonzero color entries out of twenty-seven', nz == 6)
  ! a random unitary by Gram-Schmidt on a random complex matrix, then the phase fixed to det = 1
  seed = 20260927_8
  do i = 1, 3
    do j = 1, 3
      z(i,j) = cmplx(rnd(seed) - 0.5_dp, rnd(seed) - 0.5_dp, dp)
    end do
  end do
  u = z
  do j = 1, 3
    do k = 1, j - 1
      u(:,j) = u(:,j) - dot_product(u(:,k), u(:,j)) * u(:,k)
    end do
    u(:,j) = u(:,j) / sqrt(real(dot_product(u(:,j), u(:,j)), dp))
  end do
  d = det3(u)
  u(:,1) = u(:,1) / d                                  ! |d| = 1, so this fixes det u = 1
  err = maxval(abs(matmul(conjg(transpose(u)), u) - eye()))
  call check('the constructed matrix is unitary to 1e-12', err < 1.0e-12_dp)
  call check('its determinant is one: an SU(3) color rotation', abs(det3(u) - 1.0_dp) < 1.0e-12_dp)
  ! eps_ijk U_ia U_jb U_kc = det(U) eps_abc: the singlet is invariant
  maxdev = 0.0_dp
  do a = 1, 3; do b = 1, 3; do c = 1, 3
    t = (0.0_dp, 0.0_dp)
    do i = 1, 3; do j = 1, 3; do k = 1, 3
      t = t + eps(i,j,k) * u(i,a) * u(j,b) * u(k,c)
    end do; end do; end do
    maxdev = max(maxdev, abs(t - eps(a,b,c)))
  end do; end do; end do
  call check('the color singlet is invariant under the SU(3) rotation to 1e-12', maxdev < 1.0e-12_dp)
  z = u; z(:,3) = z(:,1)
  call check('the lock fails when two color axes coincide: determinant zero', abs(det3(z)) < 1.0e-12_dp)
  frac = (2.0_dp*MU + MD)/MP
  call check('the valence quark masses carry under one percent of the proton', frac < 0.01_dp)
  call check('cited: the spectrum is gapped, the lightest hadron and the glueball massive', MPI > 0.0_dp .and. MGLUE > MPI)
  call check('cited: the quark spin record covers under half the proton spin', 0.5_dp*SIGMA < 0.5_dp*0.5_dp)
  call check('cited: the certified region of proton stability exceeds the cosmic age by 1e24', TAUP/AGE > 1.0e24_dp)
  write(*,'(a,es10.3)')  ' unitarity error               = ', err
  write(*,'(a,es10.3)')  ' singlet deviation under SU(3) = ', maxdev
  write(*,'(a,f8.4,a)')  ' valence quark mass fraction   = ', 100.0_dp*frac, ' percent'
  write(*,'(a,f8.4,a)')  ' field-carried mass fraction   = ', 100.0_dp*(1.0_dp - frac), ' percent'
  write(*,'(a,es10.3)')  ' stability certificate / age   = ', TAUP/AGE
  write(*,'(a,i0,a,i0,a)') ' BATTERY-JSON: {"checks":', nchk, ',"failures":', nfail, '}'
  if (nfail > 0) error stop 1
contains
  function rnd(s) result(r)
    integer(8), intent(inout) :: s
    real(dp) :: r
    s = mod(1103515245_8*s + 12345_8, 2147483647_8)
    r = real(s, dp) / 2147483647.0_dp
  end function rnd
  function det3(m) result(dd)
    complex(dp), intent(in) :: m(3,3)
    complex(dp) :: dd
    dd = m(1,1)*(m(2,2)*m(3,3) - m(2,3)*m(3,2)) - m(1,2)*(m(2,1)*m(3,3) - m(2,3)*m(3,1)) &
       + m(1,3)*(m(2,1)*m(3,2) - m(2,2)*m(3,1))
  end function det3
  function eye() result(e)
    complex(dp) :: e(3,3)
    integer :: q
    e = (0.0_dp, 0.0_dp)
    do q = 1, 3
      e(q,q) = (1.0_dp, 0.0_dp)
    end do
  end function eye
  subroutine check(label, cond)
    character(*), intent(in) :: label
    logical, intent(in) :: cond
    nchk = nchk + 1
    if (.not. cond) then
      nfail = nfail + 1; write(*,'(a,a)') ' FAIL  ', label
    end if
  end subroutine check
end program proton_twin
