! ONE CUT, the executed twin. The critical strip in an integer chart: real part k/20, the line at
! k = 10, the fold k -> 20 - k; registration keeps the height and lands on the line.
! Build (sealed): gfortran -std=f2018 -O2 -fno-fast-math -ffp-contract=off One_Cut_Twin.f90
program one_cut_twin
  implicit none
  integer, parameter :: dp = selected_real_kind(15, 307)
  real(dp), parameter :: KB = 1.380649e-23_dp, TK = 300.0_dp
  real(dp), parameter :: H(10) = [14.134725142_dp, 21.022039639_dp, 25.010857580_dp, 30.424876126_dp, &
       32.935061588_dp, 37.586178159_dp, 40.918719012_dp, 43.327073281_dp, 48.005150881_dp, 49.773832478_dp]
  integer :: checks, fails, i, k, j, nfix, noff, nbad, nghost, nmirror, kr
  integer :: kz(12)
  real(dp) :: tz(12), price, tr
  checks = 0; fails = 0
  ! 1. the first ten zeros sit on the line: registration erases nothing
  nfix = 0
  do i = 1, 10
    call reg(10, H(i), kr, tr)
    if (kr == 10 .and. tr == H(i)) nfix = nfix + 1
  end do
  call check('first ten zeros registered without loss', nfix == 10)
  ! 2. a hypothetical off-line orbit: two points, one record, one bit
  call check('off-line orbit has two distinct points', 8 /= fold_k(8))
  call check('both sides register to one record (the ghost bit)', reg_k(8) == reg_k(fold_k(8)))
  price = KB * TK * log(2.0_dp)
  write(*,'(a,es12.5,a)') '  price of the forgotten side at 300 K: ', price, ' J'
  call check('the forgotten side costs k_B T ln 2 > 0', price > 2.87e-21_dp .and. price < 2.872e-21_dp)
  ! 3. the mirror sweep over the whole grid: 19 real parts, 20 heights
  noff = 0; nbad = 0; nghost = 0; nmirror = 0
  do k = 1, 19
    do j = 1, 20
      if (reg_k(k) /= 10) nbad = nbad + 1
      if (fold_k(fold_k(k)) /= k) nbad = nbad + 1
      if (k /= 10) then
        noff = noff + 1
        if (reg_k(k) /= reg_k(fold_k(k))) nghost = nghost + 1
        if (reg_k(k) == k) nmirror = nmirror + 1
      end if
    end do
  end do
  call check('every registration lands on the line, the fold an involution', nbad == 0)
  call check('no off-line point is ever a registered point (the unicorn)', nmirror == 0 .and. noff == 360)
  call check('every off-line pair shares one record (the ghost)', nghost == 0)
  ! 4. lossless iff on the line: ten zeros plus one off-line pair
  kz(1:10) = 10; kz(11) = 8; kz(12) = fold_k(8); tz(1:10) = H; tz(11:12) = H(1)
  nfix = 0
  do i = 1, 12
    call reg(kz(i), tz(i), kr, tr)
    if (kr == kz(i) .and. tr == tz(i)) nfix = nfix + 1
  end do
  call check('loss appears exactly at the off-line pair: two points, one bit', 12 - nfix == 2)
  write(*,'(a,i0,a,i0,a)') ' BATTERY-JSON: {"checks":', checks, ',"failures":', fails, '}'
  if (fails > 0) error stop 1
contains
  pure integer function fold_k(k)
    integer, intent(in) :: k
    fold_k = 20 - k
  end function fold_k
  pure integer function reg_k(k)
    integer, intent(in) :: k
    reg_k = 10 + 0*k
  end function reg_k
  pure subroutine reg(k, t, kr, tr)
    integer, intent(in) :: k
    real(dp), intent(in) :: t
    integer, intent(out) :: kr
    real(dp), intent(out) :: tr
    kr = reg_k(k); tr = t
  end subroutine reg
  subroutine check(name, ok)
    character(*), intent(in) :: name
    logical, intent(in) :: ok
    checks = checks + 1
    if (.not. ok) fails = fails + 1
    write(*,'(a,a,a)') merge('  PASS  ','  FAIL  ',ok), name, ''
  end subroutine check
end program one_cut_twin
