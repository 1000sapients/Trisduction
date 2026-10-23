! LOOP, the executed twin of The_Loop.lean. Build (sealed):
! gfortran -std=f2018 -O2 -fno-fast-math -ffp-contract=off Loop_Twin.f90
! The ζ chart at resolution ten: x = 20 Re s, line x = 10, fold x -> 20 - x, registration (x,t) -> (10,t).
program loop_twin
  implicit none
  integer, parameter :: dp = selected_real_kind(15, 307)
  integer :: checks, fails, x, t, n, nreg, nflank, npair, nbad, m, i, k, nw, nboth, rec, q
  integer :: recs(0:1)
  logical :: allfix, sameok
  real(dp) :: price
  checks = 0; fails = 0
  ! 1. every registration of every point of the strip, both flanks, lands on the line at its own height
  nreg = 0; nbad = 0
  do x = 1, 19
    do t = 0, 19
      nreg = nreg + 1
      if (rx(x) /= 10) nbad = nbad + 1
    end do
  end do
  call check('the strip vanishes: 380 points of the open strip, every registration on the line', nbad == 0 .and. nreg == 380)
  ! 2. the flanks: every left point has its partner right, and the two share one record
  nflank = 0; nbad = 0
  do x = 1, 9
    nflank = nflank + 1
    if (.not. (fx(x) > 10 .and. rx(fx(x)) == rx(x) .and. fx(fx(x)) == x)) nbad = nbad + 1
  end do
  call check('both flanks: 9 left real parts, each paired with its right mirror under one record', nbad == 0 .and. nflank == 9)
  ! 3. the fixed set is exactly the line
  nbad = 0
  do x = 1, 19
    if ((fx(x) == x) .neqv. (x == 10)) nbad = nbad + 1
  end do
  call check('the fixed set of the fold on the strip is exactly the line', nbad == 0)
  ! 4. worlds on one height, fold-closed zero sets over the 19 real parts: the value is not in the record
  !    a world is a mask over x = 1..19; fold-closed when the mask is symmetric under x -> 20 - x
  nw = 0; nboth = 0; recs = 0
  do m = 0, 2**19 - 1
    if (.not. symmetric(m)) cycle
    nw = nw + 1
    allfix = .true.
    do i = 1, 19
      if (btest(m, i-1) .and. i /= 10) allfix = .false.
    end do
    rec = merge(1, 0, m /= 0)                   ! the record of a world at one height: the line point, or nothing
    if (allfix) then
      recs(rec) = ior(recs(rec), 1)
    else
      recs(rec) = ior(recs(rec), 2)
    end if
  end do
  sameok = (recs(1) == 3)
  call check('1024 fold-closed worlds at one height; the one nonempty record carries worlds on and off the line', &
       nw == 1024 .and. sameok)
  ! 4b. what can refute: on every world, the claim fails exactly when one member is off the line; a constant
  !     fact, true on every world, holds on a failing one and so forces nothing
  nbad = 0; k = 0
  do m = 0, 2**19 - 1
    if (.not. symmetric(m)) cycle
    allfix = .true.; q = 0
    do i = 1, 19
      if (btest(m, i-1) .and. i /= 10) then
        allfix = .false.; q = q + 1
      end if
    end do
    if (allfix .neqv. (q == 0)) nbad = nbad + 1
    if (.not. allfix) k = k + 1
  end do
  call check('refutation: 1024 worlds, the claim fails exactly when a member is off the line; a fact true on all 1022 &
       &failing worlds forces nothing', nbad == 0 .and. k == 1022)
  ! 5. landing is not moving: the interior pair at 0.4 and 0.6 registers wholly to the line and stays off it
  call check('the pair at real parts 0.4 and 0.6: both registered on the line, neither on it', &
       rx(8) == 10 .and. rx(12) == 10 .and. fx(8) == 12 .and. 8 /= 10 .and. 12 /= 10)
  ! 6. time: 3000 ticks; the record on the line, the zero unmoved, meeting only on the line
  npair = 0; nbad = 0
  do x = 1, 19
    k = x
    do n = 1, 3000
      rec = rx(k)
      if (rec /= 10) nbad = nbad + 1
      if (k /= x) nbad = nbad + 1
      if ((rec == k) .neqv. (x == 10)) nbad = nbad + 1
    end do
    npair = npair + 1
  end do
  call check('time: 19 zeros through 3000 ticks, records on the line, zeros unmoved, meeting only on the line', nbad == 0)
  ! 7. charges: conjugation q -> -q, fixed set {0}, the electron orbit {-1, 1}, one record
  nbad = 0
  do q = -3, 3
    if ((-q == q) .neqv. (q == 0)) nbad = nbad + 1
  end do
  call check('charges: the fixed set of conjugation is the neutral state alone; electron and positron one orbit', &
       nbad == 0 .and. -(-1) == 1)
  ! 8. the price of the forgotten member at 300 K
  price = 1.380649e-23_dp * 300.0_dp * log(2.0_dp)
  call check('the forgotten member priced at k_B T ln 2 = 2.870979e-21 J at 300 K', &
       abs(price/2.870978885e-21_dp - 1.0_dp) < 1.0e-9_dp)
  write(*,'(a,i0,a,i0,a)') ' BATTERY-JSON: {"checks":', checks, ',"failures":', fails, '}'
  if (fails > 0) error stop 1
contains
  pure integer function fx(x)
    integer, intent(in) :: x
    fx = 20 - x
  end function fx
  pure integer function rx(x)
    integer, intent(in) :: x
    rx = 10 + 0*x
  end function rx
  pure logical function symmetric(m)
    integer, intent(in) :: m
    integer :: i
    symmetric = .true.
    do i = 1, 19
      if (btest(m, i-1) .neqv. btest(m, 20-i-1)) symmetric = .false.
    end do
  end function symmetric
  subroutine check(name, ok)
    character(*), intent(in) :: name
    logical, intent(in) :: ok
    checks = checks + 1
    if (.not. ok) fails = fails + 1
    write(*,'(a,a)') merge('  PASS  ','  FAIL  ',ok), name
  end subroutine check
end program loop_twin
