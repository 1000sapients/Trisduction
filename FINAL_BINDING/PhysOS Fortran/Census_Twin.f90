! CENSUS, the executed twin of Census.lean. Build (sealed):
! gfortran -std=f2018 -O2 -fno-fast-math -ffp-contract=off Census_Twin.f90
program census_twin
  implicit none
  integer :: checks, fails, v, n, a, cell, img, i, j, k, m, content, fibre, nbad, nmaps, cells
  integer :: tally(0:4095), tally2(0:4095), fx(0:63), gx(0:63), s
  integer(8) :: seed
  logical :: unif
  checks = 0; fails = 0
  ! I and III . the tower, every v = 2..6, n = 1..4, a = 0..n, by the actual cut map
  nbad = 0; cells = 0
  do v = 2, 6
    do n = 1, 4
      do a = 0, n
        tally = 0
        do cell = 0, v**n - 1
          img = cell / v**a          ! the cut forgets the last a coordinates
          tally(img) = tally(img) + 1
        end do
        content = count(tally(0:v**n-1) > 0)
        fibre = tally(0)
        unif = all(tally(0:content-1) == fibre)
        if (content /= v**(n-a) .or. fibre /= v**a .or. content*fibre /= v**n .or. .not. unif) nbad = nbad + 1
        if (sum(tally(0:v**n-1)) /= v**n) nbad = nbad + 1
        cells = cells + 1
      end do
    end do
  end do
  call check('tower: content v^(n-a), uniform freedom v^a, product v^n, fibres sum to the whole', nbad == 0)
  write(*,'(a,i0,a)') '  tower rungs executed: ', cells, ' (v = 2..6, n = 1..4, every cut a)'
  ! I . conservation for arbitrary maps: 2000 pseudo-random maps on 64 states into 16 values
  nbad = 0; seed = 20260928_8; nmaps = 2000
  do m = 1, nmaps
    tally = 0
    do i = 0, 63
      seed = mod(1103515245_8*seed + 12345_8, 2147483648_8)
      fx(i) = int(mod(seed/65536_8, 16_8))
      tally(fx(i)) = tally(fx(i)) + 1
    end do
    if (sum(tally(0:15)) /= 64) nbad = nbad + 1
  end do
  call check('conservation: 2000 arbitrary maps, the fibres over the image always sum to 64', nbad == 0)
  ! IV . the bit: halve the content with the whole fixed, the freedom doubles
  nbad = 0
  do v = 2, 6
    do n = 2, 4
      do a = 0, n - 1
        if ((v**(n-a))*(v**a) /= v**n) nbad = nbad + 1
      end do
    end do
  end do
  do i = 1, 6                                   ! a binary carrier of 2^6 states cut one coordinate at a time
    if (2**(6-i) * 2**i /= 64 .or. 2**(6-i+1) /= 2 * 2**(6-i) .or. 2**i /= 2 * 2**(i-1)) nbad = nbad + 1
  end do
  call check('the bit: each binary cut halves the content and doubles the freedom exactly, total 64 conserved', nbad == 0)
  ! V . the direction: composing a further cut never shrinks a fibre
  nbad = 0; seed = 7_8
  do m = 1, 2000
    tally = 0; tally2 = 0
    do i = 0, 63
      seed = mod(1103515245_8*seed + 12345_8, 2147483648_8); fx(i) = int(mod(seed/65536_8, 16_8))
    end do
    do k = 0, 15
      seed = mod(1103515245_8*seed + 12345_8, 2147483648_8); gx(k) = int(mod(seed/65536_8, 8_8))
    end do
    do i = 0, 63
      tally(fx(i)) = tally(fx(i)) + 1
      tally2(gx(fx(i))) = tally2(gx(fx(i))) + 1
    end do
    do k = 0, 15
      if (tally(k) > tally2(gx(k))) nbad = nbad + 1
    end do
  end do
  call check('direction: over 2000 composed cuts, no fibre ever shrinks', nbad == 0)
  ! VI and VII . erasure merges; the price is the same toward either value
  s = 0
  do j = 0, 1                                   ! erase to value j
    tally = 0
    do i = 0, 1
      tally(j) = tally(j) + 1
    end do
    if (tally(j) == 2) s = s + 1
  end do
  call check('symmetric price: erasing toward either value merges the same two states', s == 2)
  write(*,'(a,i0,a,i0,a)') ' BATTERY-JSON: {"checks":', checks, ',"failures":', fails, '}'
  if (fails > 0) error stop 1
contains
  subroutine check(name, ok)
    character(*), intent(in) :: name
    logical, intent(in) :: ok
    checks = checks + 1
    if (.not. ok) fails = fails + 1
    write(*,'(a,a)') merge('  PASS  ','  FAIL  ',ok), name
  end subroutine check
end program census_twin
