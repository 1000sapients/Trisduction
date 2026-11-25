! Two_Branches_Twin_CC.f90 · twin of SPHYS_Two_Branches_CC.lean
! RATIONALE. The engine proves the wells of one magnetic domain, its switching curve, the heat of its record, the
!   constancy of energy under a potential and the reversal of a motion. This twin runs the same objects in numbers:
!   A the wells and the switching curve; B a loop with the field five degrees from the axis, its remanence, its
!   switching field against the formula of Stoner and Wohlfarth, its area against the heat released at the two
!   jumps; C the price of one switch in joules against the bound of Landauer; D an orbit of Kepler, its energy,
!   its area rate, its return when the velocity is turned, and the work round the closed orbit; E the maps; F the field
!   across the axis, where the two wells have one energy and meet.
! DESIGN. Double precision, no library. Energies of the domain are in units of twice the anisotropy energy K V,
!   fields in units of the anisotropy field: e = sin(t)**2/2 - h*cos(t - psi). The loop follows the well by
!   Newton steps while the stiffness is positive and by descent when it is not. The orbit is stepped by the
!   scheme of Verlet, in units with G M = 1, from the far point of an ellipse of eccentricity one half.
!   Inputs of C: K V = 40 k T at T = 300 K (the usual condition for a bit that lasts ten years);
!   k = 1.380649e-23 J/K (exact, SI 2019).
! RISK. A loop on a grid finds the switching field to the step of the grid. The orbit is one orbit.
! NON-NEGOTIABLE. Every printed value is computed here. The formula of Stoner and Wohlfarth is the thing compared
!   with, not the thing printed as found.
program two_branches_twin
  implicit none
  integer, parameter :: dp = kind(1.0d0)
  real(dp), parameter :: pi = 3.14159265358979323846_dp, kB = 1.380649e-23_dp
  integer :: nfail, npass, i, k, n, nboth, nbad, njump, nundo, g1, g2
  real(dp) :: h, t, psi, dh, m, mold, hold, area, drops, e0, e1, hsw(2), rem, hs, hx, hy, worst
  real(dp) :: q(2), p(2), a(2), dt, per, en0, en, L0, L, werr, lerr, back, work, v(3), b(3), c(3)
  real(dp) :: perswitch, land, tt
  logical :: ok
  nfail = 0; npass = 0

  ! A. the wells along the axis, and the switching curve
  nboth = 0; nbad = 0
  do i = -1500, 1500
    h = i / 1000.0_dp
    ok = (stiff(h, 0.0_dp, 0.0_dp) > 0) .and. (stiff(h, 0.0_dp, pi) > 0)
    if (ok) nboth = nboth + 1
    if (ok .neqv. (abs(h) < 1)) nbad = nbad + 1
  end do
  write(*,'(a,i0,a,i0)') '  fields from -1.5 to 1.5 in thousandths with both wells: ', nboth, '; disagreeing with |h| < 1: ', nbad
  call check('A1 both states along the axis are wells exactly for fields between -1 and 1', nbad == 0 .and. nboth == 1999)
  write(*,'(a,f8.5)') '  energy of the reversed state above the aligned one at field 1: ', en1(1.0_dp, pi) - en1(1.0_dp, 0.0_dp)
  call check('A2 the drop at the switching field is two units', abs(en1(1.0_dp, pi) - en1(1.0_dp, 0.0_dp) - 2) < 1e-14_dp)
  worst = 0
  do i = 1, 359
    t = i * pi / 180
    hx = -cos(t)**3; hy = sin(t)**3
    worst = max(worst, abs(sin(t)*cos(t) + hx*sin(t) - hy*cos(t)), abs(cos(t)**2 - sin(t)**2 + hx*cos(t) + hy*sin(t)))
    worst = max(worst, abs((hx*hx)**(1.0_dp/3) + (hy*hy)**(1.0_dp/3) - 1))
  end do
  write(*,'(a,es9.2)') '  largest slope, stiffness or departure from the astroid on the curve, 359 angles: ', worst
  call check('A3 on the curve (-cos^3, sin^3) the well ends, and the curve is the astroid', worst < 1e-13_dp)

  ! B. a loop with the field five degrees from the axis
  psi = 5 * pi / 180; dh = 1.0e-4_dp
  t = psi; h = 1.5_dp; call relax(h, psi, t)
  area = 0; drops = 0; njump = 0; rem = 0; hsw = 0
  mold = cos(t - psi); hold = h
  do k = 1, 60000
    if (k <= 30000) then
      h = 1.5_dp - k * dh
    else
      h = -1.5_dp + (k - 30000) * dh
    end if
    e0 = en2(h, psi, t); tt = t
    call relax(h, psi, t)
    e1 = en2(h, psi, t)
    if (abs(t - tt) > 0.5_dp) then
      njump = njump + 1; drops = drops + (e0 - e1)
      if (njump <= 2) hsw(njump) = abs(h)
    end if
    m = cos(t - psi)
    area = area + 0.5_dp * (h + hold) * (m - mold)
    if (k == 15000) rem = m
    mold = m; hold = h
  end do
  hs = (cos(psi)**(2.0_dp/3) + sin(psi)**(2.0_dp/3))**(-1.5_dp)
  write(*,'(a,i0)') '  jumps in one loop: ', njump
  write(*,'(a,f8.5,a,f8.5)') '  remanence: ', rem, '; cosine of five degrees: ', cos(psi)
  write(*,'(a,f8.5,a,f8.5,a,f8.5)') '  switching fields found: ', hsw(1), ' and ', hsw(2), '; formula: ', hs
  write(*,'(a,f8.5,a,f8.5)') '  area of the loop: ', area, '; energy released at the two jumps: ', drops
  call check('B1 the loop has two jumps', njump == 2)
  call check('B2 the remanence is the cosine of the angle of the field', abs(rem - cos(psi)) < 1e-6_dp)
  call check('B3 the switching field is that of Stoner and Wohlfarth', abs(hsw(1) - hs) < 2e-3_dp .and. abs(hsw(2) - hs) < 2e-3_dp)
  call check('B4 the area of the loop is the energy released at the jumps', abs(area - drops) < 5e-3_dp .and. area > 3)

  ! C. the price of one switch
  perswitch = 0.5_dp * area * 2 * 40 * kB * 300; land = kB * 300 * log(2.0_dp)
  write(*,'(a,es10.3,a,es10.3,a,f7.1)') '  one switch at K V = 40 k T, 300 K: ', perswitch, ' J; bound of Landauer: ', land, &
    ' J; ratio: ', perswitch / land
  call check('C1 one switch of the domain costs more than a hundred times the bound of Landauer', perswitch / land > 100)

  ! D. an orbit of Kepler: semi-axis 1, eccentricity 1/2, from the far point
  per = 2 * pi; n = 200000; dt = per / n
  q = [1.5_dp, 0.0_dp]; p = [0.0_dp, sqrt((1 - 0.5_dp) / (1 + 0.5_dp))]
  en0 = 0.5_dp * sum(p*p) - 1 / sqrt(sum(q*q)); L0 = q(1)*p(2) - q(2)*p(1)
  werr = 0; lerr = 0; work = 0
  call acc(q, a)
  do k = 1, n
    work = work + 0.5_dp * dt * sum(-a * p)
    p = p + 0.5_dp * dt * a; q = q + dt * p; call acc(q, a); p = p + 0.5_dp * dt * a
    work = work + 0.5_dp * dt * sum(-a * p)
    en = 0.5_dp * sum(p*p) - 1 / sqrt(sum(q*q)); L = q(1)*p(2) - q(2)*p(1)
    werr = max(werr, abs(en - en0) / abs(en0)); lerr = max(lerr, abs(L - L0))
  end do
  write(*,'(a,es9.2,a,es9.2)') '  one period: largest change of energy, relative: ', werr, '; of the area rate: ', lerr
  write(*,'(a,es9.2,a,es9.2)') '  distance from the start after one period: ', sqrt(sum((q - [1.5_dp, 0.0_dp])**2)), &
    '; work of the force round the orbit: ', work
  call check('D1 the energy of the orbit is constant', werr < 1e-6_dp)
  call check('D2 the area rate of the orbit is constant', lerr < 1e-10_dp)
  call check('D3 the force does no work round the closed orbit', abs(work) < 1e-6_dp)
  p = -p
  do k = 1, n
    p = p + 0.5_dp * dt * a; q = q + dt * p; call acc(q, a); p = p + 0.5_dp * dt * a
  end do
  back = sqrt(sum((q - [1.5_dp, 0.0_dp])**2) + sum((-p - [0.0_dp, sqrt(1.0_dp/3)])**2))
  write(*,'(a,es9.2)') '  velocity turned, one period back: distance from the first state: ', back
  call check('D4 with the velocity turned the orbit returns to its first state', back < 1e-9_dp)

  ! E. the maps
  nundo = 0; k = 0
  do g1 = 0, 1
    do g2 = 0, 1            ! the map g sends the state 0 to g1 and the state 1 to g2
      if (pick(g1, g2, stp(2.0_dp, 0)) == 0 .and. pick(g1, g2, stp(2.0_dp, 1)) == 1) nundo = nundo + 1
      if (pick(g1, g2, stp(0.5_dp, 0)) == 0 .and. pick(g1, g2, stp(0.5_dp, 1)) == 1) k = k + 1
    end do
  end do
  write(*,'(a,i0,a,i0)') '  maps of two states that undo the reset: ', nundo, ' of 4; that undo a weak field: ', k
  call check('E1 no map undoes the reset, and one undoes a step in a weak field', nundo == 0 .and. k == 1)
  worst = 0
  do i = 1, 1000
    call random_number(v); call random_number(b); v = v - 0.5_dp; b = b - 0.5_dp
    c = [v(2)*b(3) - v(3)*b(2), v(3)*b(1) - v(1)*b(3), v(1)*b(2) - v(2)*b(1)]
    worst = max(worst, abs(sum(v * c)))
  end do
  write(*,'(a,es9.2)') '  largest power of the magnetic force over 1000 velocities and fields: ', worst
  call check('E2 the magnetic force does no work', worst < 1e-15_dp)

  ! F. the field across the axis
  worst = 0; hold = 0
  do i = 0, 100
    h = i / 100.0_dp; t = asin(h)
    worst = max(worst, abs(enx(h, t) - enx(h, pi - t)))
    do k = 0, 3599
      hold = max(hold, enx(h, t) - enx(h, k * pi / 1800))
    end do
  end do
  write(*,'(a,es9.2,a,es9.2)') '  across the axis, 101 fields: largest difference of the two wells: ', worst, &
    '; largest depth of any angle below them: ', hold
  write(*,'(a,es9.2)') '  moment along the axis where the wells meet, field one: ', abs(cos(asin(1.0_dp)))
  call check('F1 across the axis the two wells have one energy, are the minimum, and meet at field one', &
    worst < 1e-14_dp .and. hold < 1e-14_dp .and. abs(cos(asin(1.0_dp))) < 1e-15_dp)

  write(*,'(a,i0,a,i0,a)') ' BATTERY-JSON: {"checks":', npass + nfail, ',"failures":', nfail, '}'
  if (nfail /= 0) stop 1
contains
  real(dp) function en1(h, t)
    real(dp), intent(in) :: h, t
    en1 = sin(t)**2 / 2 - h * cos(t)
  end function
  real(dp) function en2(h, psi, t)
    real(dp), intent(in) :: h, psi, t
    en2 = sin(t)**2 / 2 - h * cos(t - psi)
  end function
  real(dp) function enx(hy, t)          ! field across the axis
    real(dp), intent(in) :: hy, t
    enx = sin(t)**2 / 2 - hy * sin(t)
  end function
  real(dp) function slp(h, psi, t)
    real(dp), intent(in) :: h, psi, t
    slp = sin(t) * cos(t) + h * sin(t - psi)
  end function
  real(dp) function stiff(h, psi, t)
    real(dp), intent(in) :: h, psi, t
    stiff = cos(t)**2 - sin(t)**2 + h * cos(t - psi)
  end function
  subroutine relax(h, psi, t)          ! follow the well: Newton while stiff, descent otherwise
    real(dp), intent(in) :: h, psi
    real(dp), intent(inout) :: t
    integer :: it
    real(dp) :: s, kk
    do it = 1, 200000
      s = slp(h, psi, t); kk = stiff(h, psi, t)
      if (abs(s) < 1e-13_dp .and. kk > 0) exit
      if (kk > 0.05_dp) then
        t = t - s / kk
      else
        t = t - 0.05_dp * s - sign(1e-9_dp, s)
      end if
    end do
  end subroutine
  subroutine acc(q, a)
    real(dp), intent(in) :: q(2)
    real(dp), intent(out) :: a(2)
    a = -q / sqrt(sum(q*q))**3
  end subroutine
  integer function stp(h, s)           ! the step of the record: 1 the aligned well, 0 the reversed one
    real(dp), intent(in) :: h
    integer, intent(in) :: s
    if (h >= 1) then
      stp = 1
    else if (h <= -1) then
      stp = 0
    else
      stp = s
    end if
  end function
  integer function pick(g1, g2, s)     ! the map (g1, g2) at the state s
    integer, intent(in) :: g1, g2, s
    if (s == 0) then
      pick = g1
    else
      pick = g2
    end if
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
end program two_branches_twin
