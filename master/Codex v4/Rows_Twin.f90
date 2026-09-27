! =====================================================================
!  Rows_Twin.f90 v1.0.0 - Trisduction Research Group
!  The row-generic closure executed on four Pi^0_1 rows as bounded instances:
!  Goldbach, Legendre, Erdos-Straus, Collatz. For each row: the certified
!  region checked compliant; then on generated instance sets the template
!  RowClosure.least_erasure_iff_value: erasure iff the value fails, least
!  erasure iff the value holds. Self-checking: the first failing check halts.
!  BUILD: gfortran -std=f2018 -O2 -fno-fast-math -ffp-contract=off -Wall -Wextra
! =====================================================================
program rows_twin
  use, intrinsic :: iso_fortran_env, only: int64
  implicit none
  integer, parameter :: EXPECTED = 112745
  integer :: json_sets = 0, json_two = 0
  integer :: n_checks = 0, n_fail = 0
  integer(int64) :: n, k, seed, gset, gsize, i, x, y, z
  logical :: ok, val
  logical, allocatable :: isp(:)
  integer(int64), parameter :: NMAX = 20000_int64
  allocate(isp(0:NMAX)); isp = .true.; isp(0) = .false.; isp(1) = .false.
  do n = 2, NMAX
    if (isp(n)) then
      do k = n*n, NMAX, n
        isp(k) = .false.
      end do
    end if
  end do
  write(*,'(a)') 'ROWS TWIN v1.0.0: the row-generic closure on four Pi^0_1 rows'
  ! ---------------- Goldbach: every even n in [4, NMAX] is a sum of two primes
  ok = .true.
  do n = 4, NMAX, 2
    val = .false.
    do k = 2, n/2
      if (isp(k) .and. isp(n-k)) then
        val = .true.; exit
      end if
    end do
    call check('Goldbach: certified instance compliant', val)
  end do
  ! ---------------- Legendre: a prime in (n^2, (n+1)^2) for n up to sqrt(NMAX)
  do n = 1, 141
    val = .false.
    do k = n*n+1, (n+1)*(n+1)-1
      if (isp(k)) then
        val = .true.; exit
      end if
    end do
    call check('Legendre: certified instance compliant', val)
  end do
  ! ---------------- Erdos-Straus: 4/n = 1/x + 1/y + 1/z for n in [2, 2000]
  do n = 2, 2000
    val = .false.
    outer: do x = n/4 + 1, 3*n/4 + 2
      do y = x, 4*n*n
        if (4*x*y - n*(x+y) <= 0) cycle
        z = (n*x*y) / (4*x*y - n*(x+y))
        if (z >= y .and. z*(4*x*y - n*(x+y)) == n*x*y) then
          val = .true.; exit outer
        end if
        if (y > 4*n*x) exit
      end do
    end do outer
    call check('Erdos-Straus: certified instance compliant', val)
  end do
  ! ---------------- Collatz: every n in [1, 100000] reaches 1
  do n = 1, 100000
    k = n; i = 0
    do while (k /= 1 .and. i < 10000)
      if (mod(k,2_int64) == 0) then
        k = k/2
      else
        k = 3*k + 1
      end if
      i = i + 1
    end do
    call check('Collatz: certified instance reaches 1', k == 1)
  end do
  ! ---------------- the template on generated instance sets, THE DEFINITIONS EXECUTED ON A
  ! ROW WITH NATIVE OFF-LOCUS POINTS. The row is the 3n-1 map, T(n) = n/2 for even n and
  ! T(n) = 3n-1 for odd n; P(n) is "the orbit of n reaches 1". This row has genuine
  ! non-compliant instances: the orbit of 5 cycles through 5,14,7,20,10 and the orbit of 17
  ! through a cycle of length 18, and neither reaches 1. The registration keeps a compliant n
  ! and sends a non-compliant n to 1 (lands, since P(1); fixes, since compliant n is kept).
  ! For each generated Z a finite pool is fixed: Z, its image, and the twelve smallest
  ! non-compliant numbers. EVERY subset of the pool is enumerated; those with the same image
  ! as Z are the same-record sets; Erases and LeastErasure are evaluated from their
  ! definitions on that family; the value is evaluated independently; the two are compared.
  seed = 20260926; gset = 0
  block
    integer(int64) :: zs(12), pool(16), img(16), rec(12), m
    integer :: npool, nrec, nz, kk, cs, sets_seen, twoworlds, nsame, nimg
    logical :: erz, valz, lez, er2, anyfree, inz, same
    integer(int64) :: noncomp(12)
    integer :: nnc
    ! the twelve smallest non-compliant numbers of the 3n-1 map, found by orbit
    nnc = 0; m = 1_int64
    do while (nnc < 12)
      m = m + 1_int64
      if (.not. reaches_one(m)) then
        nnc = nnc + 1; noncomp(nnc) = m
      end if
    end do
    call check('3n-1 row: the orbit of 5 does not reach 1 (native off-locus point)', .not. reaches_one(5_int64))
    call check('3n-1 row: the orbit of 17 does not reach 1 (native off-locus point)', .not. reaches_one(17_int64))
    call check('3n-1 row: the orbit of 3 reaches 1 (compliant point)', reaches_one(3_int64))
    sets_seen = 0; twoworlds = 0
    do gsize = 3, 8
      do i = 1, 20
        nz = int(gsize, kind=4)
        do k = 1, gsize
          seed = mod(1103515245_int64*seed + 12345_int64, 2147483647_int64)
          if (mod(seed, 5_int64) == 0) then
            zs(k) = noncomp(1 + int(mod(seed/65536_int64, int(nnc,int64)), kind=4))   ! an injected native off-locus instance
          else
            zs(k) = 2_int64 + mod(seed/65536_int64, 400_int64)
          end if
        end do
        ! value and erasure on Z from the definitions
        valz = .true.; erz = .false.
        do k = 1, nz
          if (.not. reaches_one(zs(k))) then
            valz = .false.; erz = .true.
          end if
        end do
        call check('3n-1 template: erasure is the failure of the value, computed', erz .eqv. (.not. valz))
        ! the record of Z: image under the registration
        nrec = 0
        do k = 1, nz
          m = zs(k); if (.not. reaches_one(m)) m = 1_int64
          if (nrec == 0) then
            nrec = 1; rec(1) = m
          else if (.not. any(rec(1:nrec) == m)) then
            nrec = nrec + 1; rec(nrec) = m
          end if
        end do
        call check('3n-1 template: the record lands on the locus (lossless)', all_reach(rec, nrec))
        ! the pool: Z, its image, and the twelve non-compliant numbers, deduplicated, at most 16
        npool = 0
        do k = 1, nz
          call addpool(pool, npool, zs(k))
        end do
        do k = 1, nrec
          call addpool(pool, npool, rec(k))
        end do
        do k = 1, nnc
          if (npool < 16) call addpool(pool, npool, noncomp(k))
        end do
        ! enumerate every subset of the pool; keep those with the same image as Z
        lez = .true.; anyfree = .false.; nsame = 0
        do cs = 1, 2**npool - 1
          nimg = 0
          do kk = 1, npool
            if (btest(cs, kk-1)) then
              m = pool(kk); if (.not. reaches_one(m)) m = 1_int64
              if (nimg == 0) then
                nimg = 1; img(1) = m
              else if (.not. any(img(1:nimg) == m)) then
                nimg = nimg + 1; img(nimg) = m
              end if
            end if
          end do
          same = (nimg == nrec)
          if (same) then
            do kk = 1, nrec
              if (.not. any(img(1:nimg) == rec(kk))) same = .false.
            end do
          end if
          if (.not. same) cycle
          nsame = nsame + 1
          er2 = .false.
          do kk = 1, npool
            if (btest(cs, kk-1)) then
              if (.not. reaches_one(pool(kk))) er2 = .true.
            end if
          end do
          if (.not. er2) anyfree = .true.
          if (erz .and. .not. er2) lez = .false.
          sets_seen = sets_seen + 1
        end do
        call check('3n-1 template: Z itself is among its same-record sets', nsame >= 1)
        call check('3n-1 template: a lossless same-record set always exists', anyfree)
        call check('3n-1 template: least erasure iff the value, computed on the enumeration', lez .eqv. valz)
        inz = .false.
        do kk = 1, nrec
          if (rec(kk) == 1_int64) inz = .true.
        end do
        if (inz) twoworlds = twoworlds + 1
        gset = gset + 1
      end do
    end do
    write(*,'(a,i0,a,i0,a)') ' same-record sets enumerated: ', sets_seen, ' over 120 generated Z on the 3n-1 row; ', twoworlds, &
         ' records admit two worlds (the point 1 is the image of a compliant and of a non-compliant instance)'
    call check('3n-1 template: two worlds over one record occur in the enumeration', twoworlds > 0)
    json_sets = sets_seen; json_two = twoworlds
  end block
  call check('template executed on 120 generated instance sets of the 3n-1 row', gset == 120)
  write(*,'(a)') ' CLOSED UNDER THE TEMPLATE: the certified regions compliant; on every generated'
  write(*,'(a)') ' set, erasure is exactly the failure of the value and least erasure exactly its'
  write(*,'(a)') ' holding; the tail above every height is the offering owed, not derived here.'
  if (EXPECTED > 0) call check('census lock', n_checks == EXPECTED - 1)
  write(*,'(a,i0,a,i0,a,i0,a,i0,a)') ' BATTERY-JSON: {"checks":', n_checks, ',"failures":', n_fail, &
       ',"same_record_sets":', json_sets, ',"two_worlds":', json_two, '}'
contains
  logical function reaches_one(n0)
    integer(int64), intent(in) :: n0
    integer(int64) :: n, seen(4096)
    integer :: steps, ns
    n = n0; steps = 0; ns = 0; reaches_one = .false.
    do while (steps < 4096)
      if (n == 1_int64) then
        reaches_one = .true.; return
      end if
      if (ns > 0) then
        if (any(seen(1:ns) == n)) return      ! a cycle: the orbit never reaches 1
      end if
      ns = ns + 1; seen(ns) = n
      if (mod(n, 2_int64) == 0_int64) then
        n = n/2_int64
      else
        n = 3_int64*n - 1_int64
      end if
      steps = steps + 1
    end do
  end function reaches_one
  logical function all_reach(v, nv)
    integer(int64), intent(in) :: v(:)
    integer, intent(in) :: nv
    integer :: q
    all_reach = .true.
    do q = 1, nv
      if (.not. reaches_one(v(q))) all_reach = .false.
    end do
  end function all_reach
  subroutine addpool(pool, npool, x)
    integer(int64), intent(inout) :: pool(:)
    integer, intent(inout) :: npool
    integer(int64), intent(in) :: x
    if (npool > 0) then
      if (any(pool(1:npool) == x)) return
    end if
    if (npool < size(pool)) then
      npool = npool + 1; pool(npool) = x
    end if
  end subroutine addpool
  subroutine check(name, cond)
    character(*), intent(in) :: name
    logical, intent(in) :: cond
    n_checks = n_checks + 1
    if (.not. cond) then
      n_fail = n_fail + 1; write(*,'(a,a)') 'CHECK FAILED: ', name; error stop 1
    end if
  end subroutine check
end program rows_twin
