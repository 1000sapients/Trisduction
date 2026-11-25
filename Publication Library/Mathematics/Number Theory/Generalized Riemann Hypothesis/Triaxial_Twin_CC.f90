! Triaxial_Twin_CC.f90 · twin of Generalized_RH_Triaxial_Theorem_CC.lean
! RATIONALE. The engine proves, for every seat, that a configuration closed under the fold and witnessed by its
!   record lies on the line, that no two of the three axes give the line, and that on the line the witness holds.
!   This twin checks the same statements by exhaustion on a finite seat (A), checks the seat of the plane on a grid
!   and on random points (B), and looks at the first zeros of zeta by direct evaluation (C).
! DESIGN. Whole numbers in A. The finite seat is the 3 by 3 grid of points (x, t) with x and t in -1, 0, 1; the fold
!   sends x to -x; the registration keeps t and forgets x, as the registration of the plane keeps the height.
!   All 512 configurations are enumerated. In B the plane is complex double precision: fold(s) = 1 - conjg(s),
!   reg(s) = (1/2, imag(s)). In C zeta is evaluated on the line by the alternating series with Euler's
!   transformation, and its zeros are located by the change of sign of Hardy's function Z(t).
! RISK. Exhaustion on one finite seat and draws on the plane are instances; the statement for every seat is the
!   engine's theorem. C locates zeros on the line to the precision of the search and proves nothing about zeros
!   off it.
! NON-NEGOTIABLE. Every count is found by the enumeration, not entered.
program triaxial_twin
  implicit none
  integer, parameter :: dp = kind(1.0d0), qp = selected_real_kind(30)
  integer :: nfail, npass, m, i, j, k, nclosed, nwit, nboth, nline, nbad, nconv, n1, n2, n3, np, idx(9,2), nz, s(33), nseed
  logical :: in(9), closed, wit, online, anyp, anyon
  real(dp) :: worst, w2, w3, u(2), t, z0, z1, ta, tb, tm, zeros(5)
  complex(dp) :: sp, f
  nfail = 0; npass = 0
  call random_seed(size=nseed); s = 20260622; call random_seed(put=s(1:nseed))

  ! A. every configuration on the 3 by 3 seat
  np = 0
  do i = -1, 1; do j = -1, 1
    np = np + 1; idx(np, :) = [i, j]
  end do; end do
  nclosed = 0; nwit = 0; nboth = 0; nline = 0; nbad = 0; nconv = 0; n1 = 0; n2 = 0; n3 = 0
  do m = 0, 511
    do k = 1, 9
      in(k) = btest(m, k - 1)
    end do
    closed = .true.; wit = .true.; online = .true.; anyp = any(in); anyon = .false.
    do k = 1, 9
      if (.not. in(k)) cycle
      if (.not. in(pos(-idx(k,1), idx(k,2)))) closed = .false.
      if (idx(k,1) /= 0) online = .false.
      if (idx(k,1) == 0) anyon = .true.
      do j = 1, 9
        if (in(j) .and. j /= k .and. idx(j,2) == idx(k,2)) wit = .false.
      end do
    end do
    if (closed) nclosed = nclosed + 1
    if (wit) nwit = nwit + 1
    if (online) nline = nline + 1
    if (closed .and. wit) nboth = nboth + 1
    if (closed .and. wit .and. .not. online) nbad = nbad + 1
    if (online .and. .not. wit) nconv = nconv + 1
    if (anyp .and. wit .and. .not. online) n1 = n1 + 1            ! existence and registration, no form
    if (anyp .and. closed .and. .not. online) n2 = n2 + 1         ! existence and form, no registration
    if (closed .and. wit .and. .not. anyon) n3 = n3 + 1           ! form and registration, no existence
  end do
  write(*,'(a,i0,a,i0,a,i0,a,i0)') '  of 512 configurations: closed ', nclosed, '; witnessed ', nwit, &
    '; closed and witnessed ', nboth, '; on the line ', nline
  write(*,'(a,i0)') '  closed and witnessed and off the line: ', nbad
  call check('A1 every closed and witnessed configuration lies on the line', nbad == 0 .and. nboth > 0)
  write(*,'(a,i0)') '  on the line and not witnessed: ', nconv
  call check('A2 every configuration on the line is witnessed', nconv == 0)
  call check('A3 closed and witnessed is the same as on the line', nboth == nline)
  write(*,'(a,i0,a,i0,a,i0)') '  off the line with two axes: without form ', n1, '; without registration ', n2, &
    '; closed and witnessed with nothing on the line ', n3
  call check('A4 the triad is irreducible: each pair of axes admits a configuration off the line', &
    n1 > 0 .and. n2 > 0 .and. n3 > 0)

  ! B. the seat of the plane
  worst = 0; w2 = 0; w3 = 0
  do i = 1, 1000
    call random_number(u); sp = cmplx(4 * u(1) - 2, 60 * u(2) - 30, dp)
    worst = max(worst, abs(fold(fold(sp)) - sp))
    w2 = max(w2, abs(reg(fold(sp)) - reg(sp)), abs(real(fold(sp)) - (1 - real(sp))))
    f = cmplx(0.5_dp, aimag(sp), dp); w3 = max(w3, abs(fold(f) - f))
  end do
  write(*,'(a,es9.2,a,es9.2,a,es9.2)') '  1000 points: fold twice ', worst, '; registration kept and side turned ', w2, &
    '; points of the line moved ', w3
  call check('B1 the fold is an involution, keeps the registration, and fixes the line', &
    worst < 1e-14_dp .and. w2 < 1e-14_dp .and. w3 < 1e-300_dp)
  nbad = 0
  do i = -200, 200
    sp = cmplx(0.5_dp + i * 0.005_dp, 14.0_dp, dp)
    if ((abs(fold(sp) - sp) < 1e-15_dp) .neqv. (i == 0)) nbad = nbad + 1
  end do
  call check('B2 on 401 points of one height the fold fixes exactly the point of the line', nbad == 0)
  sp = cmplx(0.25_dp, 14.0_dp, dp)
  write(*,'(a,2f7.3,a,2f7.3,a,2f7.3)') '  the point ', sp, ' and its partner ', fold(sp), ' have one registration ', reg(sp)
  call check('B3 a point off the line and its partner are two existents with one registration', &
    abs(fold(sp) - sp) > 0.4_dp .and. abs(reg(fold(sp)) - reg(sp)) < 1e-300_dp)

  ! C. the first zeros of zeta on the line, by the sign of Hardy's function
  nz = 0; t = 10.0_dp; z0 = hardy(t)
  do while (nz < 5 .and. t < 40.0_dp)
    z1 = hardy(t + 0.05_dp)
    if (z0 * z1 < 0) then
      ta = t; tb = t + 0.05_dp
      do k = 1, 60
        tm = (ta + tb) / 2
        if (hardy(ta) * hardy(tm) <= 0) then
          tb = tm
        else
          ta = tm
        end if
      end do
      nz = nz + 1; zeros(nz) = (ta + tb) / 2
    end if
    t = t + 0.05_dp; z0 = z1
  end do
  write(*,'(a,5f11.6)') '  heights of the first zeros found on the line: ', zeros
  call check('C1 five zeros are found on the line below height 40, the first at 14.134725', &
    nz == 5 .and. abs(zeros(1) - 14.134725_dp) < 1e-5_dp .and. abs(zeros(5) - 32.935062_dp) < 1e-5_dp)
  worst = 0
  do k = 1, 5
    sp = cmplx(0.5_dp, zeros(k), dp); worst = max(worst, abs(fold(sp) - sp), abs(zeta(sp)))
  end do
  write(*,'(a,es9.2)') '  at those five: largest of the size of zeta and of the distance to the partner: ', worst
  call check('C2 each of the five is its own partner, and zeta vanishes there to the precision of the search', worst < 1e-9_dp)
  sp = cmplx(0.25_dp, zeros(1), dp)
  write(*,'(a,es9.2)') '  size of zeta at the first height, a quarter off the line: ', abs(zeta(sp))
  call check('C3 off the line at that height zeta does not vanish', abs(zeta(sp)) > 0.1_dp)

  write(*,'(a,i0,a,i0,a)') ' BATTERY-JSON: {"checks":', npass + nfail, ',"failures":', nfail, '}'
  if (nfail /= 0) stop 1
contains
  integer function pos(x, t)
    integer, intent(in) :: x, t
    pos = (x + 1) * 3 + (t + 1) + 1
  end function
  complex(dp) function fold(z)
    complex(dp), intent(in) :: z
    fold = 1 - conjg(z)
  end function
  complex(dp) function reg(z)
    complex(dp), intent(in) :: z
    reg = cmplx(0.5_dp, aimag(z), dp)
  end function
  complex(dp) function zeta(z)          ! the alternating series with Euler's transformation, for real part > 0
    complex(dp), intent(in) :: z
    integer, parameter :: nn = 60
    integer :: kk, jj
    complex(qp) :: acc, zz
    real(qp) :: e(0:nn), c
    zz = cmplx(real(z, qp), real(aimag(z), qp), qp)
    e(nn) = 1; c = 1                      ! e(k) = sum_{j=k}^{n} binomial(n, j) / 2**n, by a running sum
    do jj = nn - 1, 0, -1
      c = c * real(jj + 1, qp) / real(nn - jj, qp); e(jj) = e(jj + 1) + c
    end do
    e = e / 2.0_qp**nn
    acc = 0
    do kk = 1, nn
      acc = acc + (-1)**(kk - 1) * exp(-zz * log(real(kk, qp)))
    end do
    do kk = nn + 1, 2 * nn
      acc = acc + (-1)**(kk - 1) * e(kk - nn) * exp(-zz * log(real(kk, qp)))
    end do
    acc = acc / (1 - exp((1 - zz) * log(2.0_qp)))
    zeta = cmplx(real(acc), aimag(acc), dp)
  end function
  real(dp) function hardy(t)            ! Z(t) = exp(i theta(t)) zeta(1/2 + i t), real on the line
    real(dp), intent(in) :: t
    real(dp) :: th
    complex(dp) :: v
    th = t / 2 * log(t / (2 * 3.14159265358979323846_dp)) - t / 2 - 3.14159265358979323846_dp / 8 &
         + 1 / (48 * t) + 7 / (5760 * t**3)
    v = exp(cmplx(0.0_dp, th, dp)) * zeta(cmplx(0.5_dp, t, dp))
    hardy = real(v)
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
end program triaxial_twin
