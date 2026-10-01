! Electron_Twin.f90 · the executable twin of "The Electron Is the Seat" · Fortran 2018.
! Every figure is computed in this run from cited constants (CODATA 2018 unless stated); an
! oracle stops the program on any failure. Cited bounds enter as data and are labelled so.
program electron_twin
  implicit none
  integer, parameter :: dp = selected_real_kind(15, 307)
  real(dp), parameter :: PI = 3.14159265358979323846_dp
  real(dp), parameter :: MEC2   = 0.51099895000e6_dp       ! eV, CODATA 2018
  real(dp), parameter :: AINV18 = 137.035999084_dp         ! CODATA 2018
  real(dp), parameter :: AINVRB = 137.035999206_dp         ! Rb recoil, Morel et al. 2020
  real(dp), parameter :: AINVCS = 137.035999046_dp         ! Cs recoil, Parker et al. 2018
  real(dp), parameter :: HBAR   = 6.582119569e-16_dp       ! eV s
  real(dp), parameter :: RYD    = 13.605693122994_dp       ! eV, R_inf h c, CODATA 2018
  real(dp), parameter :: AE_EXP = 0.00115965218059_dp      ! Fan et al. 2023
  real(dp), parameter :: TAU_P  = 125.14e-12_dp            ! s, para-Ps, Al-Ramadhan & Gidley 1994
  real(dp), parameter :: TAU_O  = 142.05e-9_dp             ! s, ortho-Ps, Vallery et al. 2003
  real(dp), parameter :: DE_BOUND = 4.1e-30_dp             ! e cm, JILA 2023 (cited bound)
  real(dp), parameter :: LAMBDAC  = 3.8615926796e-11_dp    ! cm, reduced Compton wavelength
  real(dp), parameter :: HBARC  = 197.3269804e6_dp          ! eV fm
  real(dp), parameter :: A0     = 52917.7210903_dp          ! fm, Bohr radius
  real(dp), parameter :: AG = 0.75_dp, AG_S1 = 0.13_dp, AG_S2 = 0.16_dp   ! ALPHA-g 2023 (cited)
  real(dp) :: a, x, egam, e_pair, ryd_calc, k_kin, v_pot, ae_uni, ae_sch, g0p, g0o, tp, to
  real(dp) :: z_grav, round, dae, m_line, m_bent, tension
  complex(dp) :: r2(2,2), r4(2,2)
  real(dp) :: err2, err4
  integer :: nchk, nfail
  nchk = 0; nfail = 0
  ! --- annihilation: the pair lands on light, keeping its energy, forgetting which was which
  e_pair = 2.0_dp * MEC2
  egam = e_pair / 2.0_dp
  call check('annihilation at rest: total energy 2 m c^2 = 1.022 MeV', abs(e_pair - 1.0219979e6_dp) < 1.0_dp)
  ! invariant mass of two photons at opening angle th: M^2 = 2 E1 E2 (1 - cos th)
  m_line = sqrt(2.0_dp*egam*egam*(1.0_dp - cos(PI)))
  m_bent = sqrt(2.0_dp*egam*egam*(1.0_dp - cos(0.9_dp*PI)))
  call check('back to back, the two photons carry the pair''s whole rest energy', abs(m_line/e_pair - 1.0_dp) < 1.0e-12_dp)
  call check('any other opening angle carries less: the record is forced onto a line', m_bent < e_pair)
  ! --- the floor: the hydrogen ground state, kinetic energy by the virial theorem
  a = 1.0_dp / AINV18
  ryd_calc = MEC2 * a*a / 2.0_dp
  ! kinetic and potential energy of the ground state from the Bohr radius and hbar c, independently
  k_kin = HBARC**2 / (2.0_dp * MEC2 * A0**2)
  v_pot = -a * HBARC / A0
  call check('Rydberg energy m c^2 alpha^2 / 2 reproduces R_inf h c to 1e-9', abs(ryd_calc/RYD - 1.0_dp) < 1.0e-9_dp)
  call check('virial theorem from independent constants: 2T + V = 0 to 1e-9', abs((2.0_dp*k_kin + v_pot)/k_kin) < 1.0e-9_dp)
  call check('total energy T + V equals minus the Rydberg energy to 1e-9', abs((k_kin + v_pot)/RYD + 1.0_dp) < 1.0e-9_dp)
  call check('the bound electron never rests: kinetic energy > 0', k_kin > 0.0_dp)
  ! --- positronium: the photon count reads the bit of the whole; lifetimes with one-loop terms
  x = a / PI
  g0p = a**5 * MEC2 / (2.0_dp * HBAR)
  g0o = 2.0_dp*(PI*PI - 9.0_dp)/(9.0_dp*PI) * a**6 * MEC2 / HBAR
  tp = 1.0_dp / (g0p * (1.0_dp - x*(5.0_dp - PI*PI/4.0_dp)))
  to = 1.0_dp / (g0o * (1.0_dp - 10.286606_dp * x))
  call check('para-positronium (C even, two photons): lifetime within 0.5% of measured', abs(tp/TAU_P - 1.0_dp) < 5.0e-3_dp)
  call check('ortho-positronium (C odd, three photons): lifetime within 0.5% of measured', abs(to/TAU_O - 1.0_dp) < 5.0e-3_dp)
  call check('the whole bit sets a thousandfold lifetime ratio', to/tp > 1000.0_dp)
  ! --- spin: a full turn gives -1, two full turns return (SU(2), rotation about z)
  r2 = rotz(2.0_dp*PI); r4 = rotz(4.0_dp*PI)
  err2 = abs(r2(1,1) + 1.0_dp) + abs(r2(2,2) + 1.0_dp) + abs(r2(1,2)) + abs(r2(2,1))
  err4 = abs(r4(1,1) - 1.0_dp) + abs(r4(2,2) - 1.0_dp) + abs(r4(1,2)) + abs(r4(2,1))
  call check('spin: a rotation by 2 pi is -1 on the spinor', err2 < 1.0e-12_dp)
  call check('spin: a rotation by 4 pi returns the spinor', err4 < 1.0e-12_dp)
  ! --- g - 2: the universal QED series to five loops, alpha from rubidium recoil
  a = 1.0_dp / AINVRB; x = a / PI
  ae_sch = x / 2.0_dp
  ae_uni = 0.5_dp*x - 0.328478965579193_dp*x**2 + 1.181241456587_dp*x**3 &
           - 1.912245764926_dp*x**4 + 6.737_dp*x**5
  dae = ae_uni - AE_EXP
  call check('Schwinger term alpha/2pi fixes a_e to three figures', abs(ae_sch - AE_EXP) < 2.0e-6_dp)
  call check('five-loop universal series meets experiment to 1e-11', abs(dae) < 1.0e-11_dp)
  ! --- cited bounds, entered as data
  round = DE_BOUND / LAMBDAC
  call check('cited: EDM bound below 1e-18 of the electron''s own length scale', round < 1.0e-18_dp)
  z_grav = abs(1.0_dp - AG) / sqrt(AG_S1**2 + AG_S2**2)
  call check('cited: antihydrogen falls as matter does, within two standard deviations', z_grav < 2.0_dp)
  tension = abs(AINVRB - AINVCS) / sqrt(0.000000011_dp**2 + 0.000000027_dp**2)
  call check('cited: the rubidium and caesium values of alpha differ by more than five sigma (open)', tension > 5.0_dp)
  write(*,'(a,f14.3,a)')  ' annihilation energy       = ', e_pair/1.0e3_dp, ' keV'
  write(*,'(a,f14.9,a)')  ' Rydberg energy (computed) = ', ryd_calc, ' eV'
  write(*,'(a,f14.9,a,f14.9,a)') ' ground state T, V         = ', k_kin, ' eV, ', v_pot, ' eV'
  write(*,'(a,f10.3,a,f10.3,a)') ' para-Ps lifetime          = ', tp*1.0e12_dp, ' ps   (measured ', TAU_P*1.0e12_dp, ' ps)'
  write(*,'(a,f10.3,a,f10.3,a)') ' ortho-Ps lifetime         = ', to*1.0e9_dp,  ' ns   (measured ', TAU_O*1.0e9_dp,  ' ns)'
  write(*,'(a,f10.1)')    ' lifetime ratio ortho/para = ', to/tp
  write(*,'(a,es10.3)')   ' spinor error at 2 pi      = ', err2
  write(*,'(a,f18.15)')   ' a_e, universal five-loop  = ', ae_uni
  write(*,'(a,f18.15)')   ' a_e, measured (Fan 2023)  = ', AE_EXP
  write(*,'(a,es10.3)')   ' difference                = ', dae
  write(*,'(a,es10.3)')   ' EDM bound / lambda_C      = ', round
  write(*,'(a,f6.2)')     ' ALPHA-g deviation (sigma) = ', z_grav
  write(*,'(a,f6.2)')     ' alpha tension Rb-Cs (sig) = ', tension
  write(*,'(a,i0,a,i0,a)') ' BATTERY-JSON: {"checks":', nchk, ',"failures":', nfail, '}'
  if (nfail > 0) error stop 1
contains
  function rotz(theta) result(r)
    real(dp), intent(in) :: theta
    complex(dp) :: r(2,2)
    r = (0.0_dp, 0.0_dp)
    r(1,1) = exp(cmplx(0.0_dp, -theta/2.0_dp, dp))
    r(2,2) = exp(cmplx(0.0_dp,  theta/2.0_dp, dp))
  end function rotz
  subroutine check(label, cond)
    character(*), intent(in) :: label
    logical, intent(in) :: cond
    nchk = nchk + 1
    if (.not. cond) then
      nfail = nfail + 1; write(*,'(a,a)') ' FAIL  ', label
    end if
  end subroutine check
end program electron_twin