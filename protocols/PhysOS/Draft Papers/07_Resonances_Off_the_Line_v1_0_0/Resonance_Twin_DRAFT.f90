! Resonance_Twin.f90 · the executed twin of SPHYS_Resonance.lean · Fortran 2018.
! Build (sealed): gfortran -std=f2018 -O2 -fno-fast-math -ffp-contract=off Resonance_Twin.f90
! Blocks: A the carrier; B the line shape; C width and lifetime across the particles; D the stable
! particles on the line; E the width counts the doors; F the width is the leak; G the survival
! law; H decay and capture, one line.
program resonance_twin
  implicit none
  integer, parameter :: dp = selected_real_kind(15, 307)
  integer, parameter :: i8 = selected_int_kind(18)
  real(dp), parameter :: HBAR_EVS = 6.582119569e-16_dp, YEAR = 3.15576e7_dp, PI = 3.141592653589793_dp
  integer :: checks, fails
  integer(i8) :: seed
  checks = 0; fails = 0; seed = 20260930_i8
  call block_a(); call block_b(); call block_c(); call block_d()
  call block_e(); call block_f(); call block_g(); call block_h()
  write(*,'(a,i0,a,i0,a)') ' BATTERY-JSON: {"checks":', checks, ',"failures":', fails, '}'
  if (fails > 0) error stop 1
contains
  subroutine check(name, ok)
    character(*), intent(in) :: name
    logical, intent(in) :: ok
    checks = checks + 1
    if (.not. ok) fails = fails + 1
    write(*,'(a,a)') merge('  PASS  ', '  FAIL  ', ok), name
  end subroutine check

  function rnd() result(r)
    real(dp) :: r
    seed = modulo(16807_i8*seed, 2147483647_i8)
    r = real(seed, dp)/2147483647.0_dp
  end function rnd

  subroutine block_a()
    integer :: m, g, n, nline, nmir
    write(*,'(a)') 'A · a resonance stands off the line by its width; its mirror is its fold partner'
    n = 0; nline = 0; nmir = 0
    do m = -30, 30
      do g = -30, 30
        n = n + 1
        ! the decaying state (m, g) lands at (1 + g, m); its mirror (m, -g) at (1 - g, m)
        if ((1 + g == 1) .eqv. (g == 0)) nline = nline + 1
        if (1 - g == 2 - (1 + g)) nmir = nmir + 1
      end do
    end do
    call check('3721 states: on the line exactly when the width vanishes', nline == n)
    call check('3721 states: decay and capture are fold partners with one mass', nmir == n)
  end subroutine block_a

  pure function bw(e, m, g) result(f)
    real(dp), intent(in) :: e, m, g
    real(dp) :: f
    f = (0.5_dp*g)**2/((e - m)**2 + (0.5_dp*g)**2)
  end function bw

  subroutine block_b()
    integer :: k, nsteps
    real(dp) :: m, g, lo, hi, area, e, de, half, fl
    write(*,'(a)') 'B · the line shape: half maximum at half the width, area pi times the half width'
    m = 91.1876_dp; g = 2.4955_dp
    half = max(abs(bw(m + 0.5_dp*g, m, g) - 0.5_dp), abs(bw(m - 0.5_dp*g, m, g) - 0.5_dp))
    lo = m; hi = m + 5.0_dp*g
    do k = 1, 200
      fl = bw(0.5_dp*(lo + hi), m, g)
      if (fl > 0.5_dp) then
        lo = 0.5_dp*(lo + hi)
      else
        hi = 0.5_dp*(lo + hi)
      end if
    end do
    nsteps = 2000000; de = 2.0e4_dp*g/real(nsteps, dp); area = 0.0_dp
    do k = 0, nsteps
      e = m - 1.0e4_dp*g + real(k, dp)*de
      area = area + merge(0.5_dp, 1.0_dp, k == 0 .or. k == nsteps)*bw(e, m, g)*de
    end do
    write(*,'(a,es9.2,a,f10.6,a,f9.6)') '  |shape - 1/2| at M +- Gamma/2 = ', half, ';  full width found ', &
         2.0_dp*(lo - m), ';  area / (pi Gamma/2) = ', area/(PI*0.5_dp*g)
    call check('the Z line falls to half its peak at M +- Gamma/2, and its full width is Gamma', &
               half < 1.0e-14_dp .and. abs(2.0_dp*(lo - m) - g) < 1.0e-12_dp)
    call check('the area under the line is pi times the half width (to 1e-4)', abs(area/(PI*0.5_dp*g) - 1.0_dp) < 1.0e-4_dp)
  end subroutine block_b

  subroutine block_c()
    real(dp) :: tau(6), gam(6)
    character(len=8) :: nm(6)
    integer :: k
    write(*,'(a)') 'C · width and lifetime, Gamma tau = hbar, across thirty decades'
    nm = ['neutron ', 'muon    ', 'tau     ', 'pi0     ', 'Z       ', 'top     ']
    tau(1) = 878.4_dp; tau(2) = 2.1969811e-6_dp; tau(3) = 290.3e-15_dp; tau(4) = 8.43e-17_dp
    gam(5) = 2.4955e9_dp; gam(6) = 1.42e9_dp
    do k = 1, 4
      gam(k) = HBAR_EVS/tau(k)
    end do
    do k = 5, 6
      tau(k) = HBAR_EVS/gam(k)
    end do
    do k = 1, 6
      write(*,'(a,a,a,es11.4,a,es11.4,a)') '  ', nm(k), ' width ', gam(k), ' eV, lifetime ', tau(k), ' s'
    end do
    call check('the neutron stands 7.49e-19 eV off the line and the Z 2.50e9 eV: 27 decades of widths', &
               abs(gam(1)/7.4934e-19_dp - 1.0_dp) < 1.0e-3_dp .and. gam(5)/gam(1) > 1.0e27_dp)
    call check('the widths from lifetimes: muon 2.996e-10 eV, tau 2.267e-3 eV, neutral pion 7.81 eV', &
               abs(gam(2)/2.9959e-10_dp - 1.0_dp) < 1.0e-3_dp .and. abs(gam(3)/2.2674e-3_dp - 1.0_dp) < 1.0e-3_dp &
               .and. abs(gam(4)/7.808_dp - 1.0_dp) < 1.0e-3_dp)
  end subroutine block_c

  subroutine block_d()
    real(dp) :: ge, gp
    write(*,'(a)') 'D · the stable particles stand on the line to the depth their lifetimes allow'
    ge = HBAR_EVS/(6.6e28_dp*YEAR); gp = HBAR_EVS/(2.4e34_dp*YEAR)
    write(*,'(a,es10.3,a,es10.3,a)') '  electron width < ', ge, ' eV;  proton width < ', gp, ' eV'
    call check('the electron stands on the line to 3e-52 eV and the proton to 9e-58 eV', &
               ge < 1.0e-51_dp .and. gp < 1.0e-57_dp)
  end subroutine block_d

  subroutine block_e()
    real(dp) :: gf, mz, gnu, ginv, nnu
    write(*,'(a)') 'E · the width counts the doors: the Z''s invisible width and the light neutrinos'
    gf = 1.1663788e-5_dp; mz = 91.1876_dp
    gnu = gf*mz**3/(12.0_dp*sqrt(2.0_dp)*PI)
    ginv = 0.4990_dp; nnu = ginv/gnu
    write(*,'(a,f8.5,a,f6.4,a,f6.3)') '  one neutrino door at tree level ', gnu, ' GeV; invisible width ', ginv, &
         ' GeV; doors counted ', nnu
    call check('the invisible width counts three open doors (tree level, within 0.05)', abs(nnu - 3.0_dp) < 0.05_dp)
  end subroutine block_e

  subroutine block_f()
    integer :: t, nsum, nsign, nclosed
    real(dp) :: a, b, c, l
    complex(dp) :: tr, dt, disc, e1, e2
    write(*,'(a)') 'F · the width is the leak: an open two-level system, H = [[a, c], [c, b - i l]]'
    nsum = 0; nsign = 0; nclosed = 0
    do t = 1, 20000
      a = 10.0_dp*(rnd() - 0.5_dp); b = 10.0_dp*(rnd() - 0.5_dp); c = 10.0_dp*(rnd() - 0.5_dp)
      l = 5.0_dp*rnd()
      tr = cmplx(a + b, -l, dp); dt = cmplx(a, 0.0_dp, dp)*cmplx(b, -l, dp) - c*c
      disc = sqrt(tr*tr - 4.0_dp*dt)
      e1 = 0.5_dp*(tr + disc); e2 = 0.5_dp*(tr - disc)
      if (abs(aimag(e1) + aimag(e2) + l) < 1.0e-12_dp) nsum = nsum + 1
      if (aimag(e1) <= 1.0e-12_dp .and. aimag(e2) <= 1.0e-12_dp) nsign = nsign + 1
      tr = cmplx(a + b, 0.0_dp, dp); dt = cmplx(a*b - c*c, 0.0_dp, dp)
      disc = sqrt(tr*tr - 4.0_dp*dt)
      if (abs(aimag(0.5_dp*(tr + disc))) < 1.0e-12_dp .and. abs(aimag(0.5_dp*(tr - disc))) < 1.0e-12_dp) &
        nclosed = nclosed + 1
    end do
    call check('20000 open systems: the two rates sum to the leak, and both decay', nsum == 20000 .and. nsign == 20000)
    call check('20000 closed systems: every energy on the line', nclosed == 20000)
  end subroutine block_f

  subroutine block_g()
    real(dp) :: half
    write(*,'(a)') 'G · the survival law: the population falls as exp(-Gamma t / hbar)'
    half = 878.4_dp*log(2.0_dp)
    write(*,'(a,f7.2,a)') '  the free neutron''s half-life, tau ln 2 = ', half, ' s'
    call check('the neutron''s half-life is 608.9 s', abs(half - 608.86_dp) < 0.05_dp)
  end subroutine block_g

  subroutine block_h()
    integer :: k, n
    real(dp) :: e
    write(*,'(a)') 'H · decay and capture: one line shape, the arrow choosing the sign'
    n = 0
    do k = -500, 500
      e = 91.1876_dp + 0.01_dp*real(k, dp)
      if (bw(e, 91.1876_dp, 2.4955_dp) == bw(e, 91.1876_dp, -2.4955_dp)) n = n + 1
    end do
    call check('the decaying and the capturing state give one line at all 1001 energies, exactly', n == 1001)
  end subroutine block_h
end program resonance_twin
