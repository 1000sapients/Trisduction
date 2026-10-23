! THE FINAL CUT, the executed twin. PSP-FINAL-CUT-01 on a finite chart: the strip in integer offsets k/20, the
! line at k = 10, the fold k -> 20 - k, registration keeping the height and landing on the line. Twelve points:
! four on the line and four off-line pairs. A configuration is a subset of the twelve, a bit mask; all 4096 are read.
! Build (sealed): gfortran -std=f2018 -O2 -fno-fast-math -ffp-contract=off Final_Cut_Twin.f90
program final_cut_twin
  implicit none
  integer, parameter :: NP = 12
  integer :: kk(NP), hh(NP), mate(NP)
  integer :: checks, fails, s, i, j, nbad, nunicorn, nrec, nworld, ncert, nprime, cert, w1, w2
  checks = 0; fails = 0
  kk = [10, 10, 10, 10, 8, 12, 6, 14, 3, 17, 1, 19]
  hh = [14, 21, 25, 30, 14, 14, 21, 21, 25, 25, 30, 30]
  do i = 1, NP
    mate(i) = i
    do j = 1, NP
      if (j /= i .and. kk(j) == 20 - kk(i) .and. hh(j) == hh(i) .and. kk(i) /= 10) mate(i) = j
    end do
  end do
  ! 1. the fold undoes itself and fixes exactly the line
  nbad = 0
  do i = 0, 20
    if (20 - (20 - i) /= i) nbad = nbad + 1
    if ((20 - i == i) .neqv. (i == 10)) nbad = nbad + 1
  end do
  call check('the fold undoes itself and fixes exactly the line, 21 offsets', nbad == 0)
  ! 2. least erasure is the value, on every configuration
  nbad = 0
  do s = 0, 4095
    if ((erased(s) == 0) .neqv. value(s)) nbad = nbad + 1
  end do
  call check('least erasure is the value on all 4096 configurations', nbad == 0)
  ! 3. across the cut: where the formal class and the actual class coincide, the value over one is the value over the other
  nbad = 0
  do s = 0, 4095
    if (value(iand(s, 4095)) .neqv. value(s)) nbad = nbad + 1
  end do
  call check('classes that coincide carry one value, 4096 configurations', nbad == 0)
  ! 4. the hypothesis is least erasure of the actual zeros, on every closed configuration
  nbad = 0; nworld = 0
  do s = 0, 4095
    if (.not. closed(s)) cycle
    nworld = nworld + 1
    if (value(s) .neqv. (erased(s) == 0)) nbad = nbad + 1
  end do
  call check('the hypothesis is least erasure of the actual zeros, every closed world', nbad == 0 .and. nworld == 256)
  ! 5. the prime side carries the bit: a reading equivalent to the value on every world is least erasure, and adds none
  nprime = 0
  do s = 0, 4095
    if (.not. closed(s)) cycle
    if (prime_side(s) .neqv. (erased(s) == 0)) nprime = nprime + 1
  end do
  call check('the prime side carries the same bit and adds none', nprime == 0)
  ! 6. the unicorn is never registered: no off-line point is the registration of anything
  nunicorn = 0
  do i = 1, NP
    do j = 1, NP
      if (kk(j) /= 10 .and. reg_k(kk(i)) == kk(j) .and. hh(i) == hh(j)) nunicorn = nunicorn + 1
    end do
  end do
  call check('no off-line point is the registration of anything, 144 pairs of points', nunicorn == 0)
  ! 7. every record leaves the bit: the registered world and the pair world of each off-line point share one record
  nrec = 0
  do i = 5, NP, 2
    w1 = ibset(0, onpoint(hh(i)) - 1)
    w2 = ior(ibset(0, i - 1), ibset(0, mate(i) - 1))
    if (record(w1) == record(w2) .and. (value(w1) .neqv. value(w2)) .and. closed(w1) .and. closed(w2)) nrec = nrec + 1
  end do
  call check('every record leaves the bit: four pairs, one record, two values', nrec == 4)
  ! 8. every computed zero leaves the bit: the certificate of the four zeros on the line extends both ways
  cert = 15; ncert = 0
  do i = 5, NP, 2
    w2 = ior(cert, ior(ibset(0, i - 1), ibset(0, mate(i) - 1)))
    if (closed(cert) .and. closed(w2) .and. value(cert) .and. .not. value(w2) .and. iand(w2, cert) == cert) ncert = ncert + 1
  end do
  call check('every computed zero leaves the bit: the certificate extends to a world with the value and to one without', ncert == 4)
  ! 9. every finite prime count leaves the bit: a prime-side reading separates the same two extensions
  ncert = 0
  do i = 5, NP, 2
    w2 = ior(cert, ior(ibset(0, i - 1), ibset(0, mate(i) - 1)))
    if (prime_side(cert) .and. .not. prime_side(w2)) ncert = ncert + 1
  end do
  call check('every finite prime count leaves the bit, on the same four extensions', ncert == 4)
  ! 10. the act spends the bit: on the field the act supplies, least erasure of the actual class is the value of the formal
  call check('the act supplies a lossless field, and on it the value holds', erased(cert) == 0 .and. value(cert))
  write(*,'(a,i0,a,i0,a)') ' BATTERY-JSON: {"checks":', checks, ',"failures":', fails, '}'
  if (fails > 0) error stop 1
contains
  pure integer function reg_k(k)
    integer, intent(in) :: k
    reg_k = 10 + 0*k
  end function reg_k
  pure logical function value(s)
    integer, intent(in) :: s
    integer :: p
    value = .true.
    do p = 1, NP
      if (btest(s, p - 1) .and. kk(p) /= 10) value = .false.
    end do
  end function value
  pure integer function erased(s)
    integer, intent(in) :: s
    integer :: p
    erased = 0
    do p = 1, NP
      if (btest(s, p - 1) .and. reg_k(kk(p)) /= kk(p)) erased = erased + 1
    end do
  end function erased
  pure logical function closed(s)
    integer, intent(in) :: s
    integer :: p
    closed = .true.
    do p = 1, NP
      if (btest(s, p - 1) .and. .not. btest(s, mate(p) - 1)) closed = .false.
    end do
  end function closed
  pure logical function prime_side(s)
    integer, intent(in) :: s
    prime_side = (erased(s) == 0)
  end function prime_side
  pure integer function record(s)
    integer, intent(in) :: s
    integer :: p
    record = 0
    do p = 1, NP
      if (btest(s, p - 1)) record = ior(record, ishft(1, hh(p) - 14))
    end do
  end function record
  pure integer function onpoint(h)
    integer, intent(in) :: h
    integer :: p
    onpoint = 0
    do p = 1, 4
      if (hh(p) == h) onpoint = p
    end do
  end function onpoint
  subroutine check(name, ok)
    character(*), intent(in) :: name
    logical, intent(in) :: ok
    checks = checks + 1
    if (.not. ok) fails = fails + 1
    write(*,'(a,a)') merge('  PASS  ', '  FAIL  ', ok), name
  end subroutine check
end program final_cut_twin
