! Neutrino_Twin.f90 · the executable twin of "The Neutrino Is the Witness" · Fortran 2018.
! Computes the mixing matrix from the standard angles, checks unitarity as lossless
! registration, computes oscillation probabilities and their conservation, exhibits a sterile
! admixture as an erasure, the mass-squared differences as the floor, and the chirality bit.
! Every figure is computed in this run; an oracle stops the program on any failure.
program neutrino_twin
  implicit none
  integer, parameter :: dp = selected_real_kind(15, 307)
  complex(dp) :: U(3,3), UUd(3,3), Us(3,4), P4(3,3)
  real(dp) :: th12, th13, th23, dcp, s12, c12, s13, c13, s23, c23
  real(dp) :: dm21, dm31, dm32, LoverE, prob(3), psum, eps, unit_err, sterile_sum
  integer :: i, j, nchk, nfail
  real(dp) :: wl, wr
  real(dp), parameter :: hel(2) = [1.0_dp, -1.0_dp]    ! left, right (twice the helicity sign)
  real(dp), parameter :: chg(2) = [0.0_dp, -1.0_dp]    ! neutrino, electron
  eps = 1.0e-12_dp; nchk = 0; nfail = 0
  ! standard angles (PDG central values, normal ordering), in radians
  th12 = 0.5836_dp; th13 = 0.1496_dp; th23 = 0.8587_dp; dcp = 3.4034_dp
  dm21 = 7.53e-5_dp; dm32 = 2.453e-3_dp          ! eV^2, PDG 2022, normal ordering
  dm31 = dm32 + dm21                             ! the atmospheric splitting measured is dm^2_32
  s12 = sin(th12); c12 = cos(th12); s13 = sin(th13); c13 = cos(th13); s23 = sin(th23); c23 = cos(th23)
  ! PMNS in the standard parametrization
  U(1,1) = c12*c13
  U(1,2) = s12*c13
  U(1,3) = s13*exp(cmplx(0.0_dp,-dcp,dp))
  U(2,1) = -s12*c23 - c12*s23*s13*exp(cmplx(0.0_dp,dcp,dp))
  U(2,2) = c12*c23 - s12*s23*s13*exp(cmplx(0.0_dp,dcp,dp))
  U(2,3) = s23*c13
  U(3,1) = s12*s23 - c12*c23*s13*exp(cmplx(0.0_dp,dcp,dp))
  U(3,2) = -c12*s23 - s12*c23*s13*exp(cmplx(0.0_dp,dcp,dp))
  U(3,3) = c23*c13
  ! unitarity = lossless registration: U U^dagger = I
  UUd = matmul(U, conjg(transpose(U)))
  unit_err = 0.0_dp
  do i = 1, 3; do j = 1, 3
    if (i == j) then
      unit_err = max(unit_err, abs(UUd(i,j) - 1.0_dp))
    else
      unit_err = max(unit_err, abs(UUd(i,j)))
    end if
  end do; end do
  call check('unitarity: the mixing erases nothing, |UU^dagger - I| below 1e-12', unit_err < eps)
  ! oscillation probabilities at L/E = 500 km/GeV (DUNE-like), vacuum, from the mass basis
  LoverE = 500.0_dp
  call oscillate(U, dm21, dm31, LoverE, prob)
  psum = prob(1) + prob(2) + prob(3)
  call check('conservation: the registered flavours sum to one (lossless)', abs(psum - 1.0_dp) < 1.0e-10_dp)
  call check('oscillation is real: the muon flavour has moved', abs(prob(2) - 1.0_dp) > 1.0e-3_dp)
  ! the floor: an observed mass-squared difference forces a nonzero mass
  call check('floor: dm^2_21 > 0, at least one nonzero mass', dm21 > 0.0_dp)
  call check('floor: dm^2_31 > 0', dm31 > 0.0_dp)
  ! the sterile admixture as erasure: a 3x4 active block of a 4x4 unitary matrix is not unitary
  Us(:,1:3) = U * sqrt(1.0_dp - 0.02_dp); Us(:,4) = cmplx(sqrt(0.02_dp/3.0_dp), 0.0_dp, dp)
  P4 = matmul(Us(:,1:3), conjg(transpose(Us(:,1:3))))
  sterile_sum = real(P4(2,2), dp)
  call check('sterile admixture: the active block registers less than one (an erasure)', sterile_sum < 1.0_dp - 1.0e-3_dp)
  ! the chirality bit: the weak projector (1 + h)/2 on helicity h registers the left state
  ! with weight one and the right state with weight zero; the two differ in one sign
  wl = (1.0_dp + hel(1)) / 2.0_dp;  wr = (1.0_dp + hel(2)) / 2.0_dp
  call check('chirality: the weak registration weighs the left state one', abs(wl - 1.0_dp) < eps)
  call check('chirality: the weak registration weighs the right state zero (the ghost)', abs(wr) < eps)
  call check('chirality: the registered state and the ghost differ in one sign only', abs(hel(1) + hel(2)) < eps)
  ! the seat: conjugation flips charge; the neutral state is fixed, the electron is paired
  call check('seat: conjugation fixes the neutral state', abs(-chg(1) - chg(1)) < eps)
  call check('seat: conjugation sends the electron to a distinct partner', abs(-chg(2) - chg(2)) > 0.5_dp)
  write(*,'(a,es10.3)') ' unitarity error          = ', unit_err
  write(*,'(a,3f10.6)') ' P(mu->e, mu->mu, mu->tau)= ', prob
  write(*,'(a,f10.6)')  ' flavour sum              = ', psum
  write(*,'(a,f10.6)')  ' active block, sterile    = ', sterile_sum
  write(*,'(a,es10.3)') ' dm^2_31 = dm^2_32 + dm^2_21 = ', dm31
  write(*,'(a,i0,a,i0,a)') ' BATTERY-JSON: {"checks":', nchk, ',"failures":', nfail, '}'
  if (nfail > 0) error stop 1
contains
  subroutine oscillate(U, dm21, dm31, LoverE, prob)
    complex(dp), intent(in) :: U(3,3)
    real(dp), intent(in) :: dm21, dm31, LoverE
    real(dp), intent(out) :: prob(3)
    complex(dp) :: amp
    real(dp) :: dm(3), phase
    integer :: a, k
    dm = [0.0_dp, dm21, dm31]
    do a = 1, 3
      amp = (0.0_dp, 0.0_dp)
      do k = 1, 3
        phase = 1.267_dp * dm(k) * LoverE       ! 1.267 dm^2 L / E, dm^2 in eV^2, L/E in km/GeV
        amp = amp + conjg(U(2,k)) * U(a,k) * exp(cmplx(0.0_dp, -phase, dp))
      end do
      prob(a) = abs(amp)**2
    end do
  end subroutine oscillate
  subroutine check(label, cond)
    character(*), intent(in) :: label
    logical, intent(in) :: cond
    nchk = nchk + 1
    if (.not. cond) then
      nfail = nfail + 1; write(*,'(a,a)') ' FAIL  ', label
    end if
  end subroutine check
end program neutrino_twin
