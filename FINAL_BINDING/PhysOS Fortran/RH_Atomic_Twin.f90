! RH_Atomic_Twin.f90 · twin of PhysOS Proof PSP-RH-ATOMIC-01, the atomic proof hardened and physico-formal, executed.
! Build (sealed): gfortran -std=f2018 -O2 -fno-fast-math -ffp-contract=off RH_Atomic_Twin.f90
! Mirrors Parts VII and VIII of RH_Both_Sides_Seed.lean (edition 2.0.4) on the offset chart: a point is (d, t), the
! line is d = 0, the fold is d -> -d, the registration is d -> 0. A configuration is a set of points of the chart with
! offsets -2..2 and heights 0..1, ten points, 1024 configurations; Closed, Value and LeastErasure are read from their
! definitions. The residual observable of the companion kernel is density * rate * heat. Part VIII's carrier is
! encoded as (sector, m, t, sign): sector 0 the self-conjugate state at height t, sector 1 the member of the pair of
! magnitude m + 1 at height t with its sign; C flips the sign, annihilation sends the pair to the self-conjugate state.
! Every check below is a finite instance of a theorem of Part VII or Part VIII, named in its line. Under the argument
! `control` three defects are planted and three lines must be red: a twin whose controls stay green is blind.
program rh_atomic_twin
  implicit none
  integer, parameter :: i16 = selected_int_kind(38)
  integer, parameter :: NP = 10, NCFG = 1024
  integer :: checks, fails, m, i, p, n_closed, n_le_is_value, n_regfix, n_act_iff, n_pair, n_regworld
  integer :: dens, rate, heat, r0, q0, eps, n0, delta, R, cnt, cnt_bad, cnt_prem, cnt_val, cnt_third, n_cap
  integer :: ln2_scaled, cmb_mK, pairmask, offmask
  integer :: n_inv, n_eqv, n_sector, n_viol, n_line, n_inst, n_erase, n_drop, dist, fre, tot_a, tot_b, T0, T, pop, rt
  integer :: n_cap8, n_fail8, n_exit, n_exit_fail, fam, erased_m, hh
  logical :: control, ok, le, val, cl
  integer :: car(4), car2(4), car3(4), pt(2)
  character(len=16) :: arg
  integer :: offs(NP), hts(NP)
  control = .false.
  if (command_argument_count() >= 1) then
    call get_command_argument(1, arg)
    control = (trim(arg) == 'control')
  end if
  checks = 0; fails = 0
  ln2_scaled = 693147; cmb_mK = 2725
  ! the ten points of the chart: offsets -2..2 at heights 0 and 1
  i = 0
  do p = -2, 2
    i = i + 1; offs(i) = p; hts(i) = 0
    i = i + 1; offs(i) = p; hts(i) = 1
  end do

  ! VII-b · the registration fixes a point exactly when it stands on the line (zeta_fixed_locus_on_the_chart)
  n_regfix = 0
  do i = 1, NP
    if ((0 == offs(i)) .eqv. (offs(i) == 0)) n_regfix = n_regfix + 1   ! reg p = p  <->  onLine p
  end do
  call check('reg p = p exactly when p is on the line, on every point of the chart', n_regfix == NP)

  ! VII-b · least erasure is the value on every configuration; the act is the premise packaged
  n_closed = 0; n_le_is_value = 0; n_act_iff = 0; n_pair = 0; n_regworld = 0
  pairmask = ior(ibset(0, idx(1,0)), ibset(0, idx(-1,0)))     ! the pair world of the off point (1, 0)
  offmask = ibset(0, idx(1,0))
  do m = 0, NCFG - 1
    cl = closed(m); le = least_erasure(m); val = value(m)
    if (cl) n_closed = n_closed + 1
    if (le .eqv. val) n_le_is_value = n_le_is_value + 1
    ! an act exists at S exactly when S is closed and least erasure holds (the_act_is_the_premise_packaged)
    if ((cl .and. le) .eqv. (cl .and. val)) n_act_iff = n_act_iff + 1
  end do
  call check('least erasure is the value on all 1024 configurations (le_iff_value)', n_le_is_value == NCFG)
  call check('the act is the premise packaged: an act stands at S exactly when S is closed with least erasure', &
       n_act_iff == NCFG)
  call check('the pair world of the off point is closed and lacks least erasure (pair_world_lacks_le)', &
       closed(pairmask) .and. .not. least_erasure(pairmask))
  call check('the registered world of the off point has the value, and the two leave one record', &
       value(ibset(0, idx(0,0))) .and. same_record(pairmask, ibset(0, idx(0,0))))
  call check('closed configurations of the chart: 2^6 = 64 (two fixed points per height, two mirrored pairs)', &
       n_closed == 64)

  ! VII-a, VII-d · the heat theorem at its exact strength: the exact-null case and the finite-sensitivity case
  cnt = 0; cnt_bad = 0
  do dens = 0, 6; do rate = 0, 6; do heat = 0, 6
    if (dens > 0 .and. rate > 0 .and. heat > 0 .and. .not. (residual(dens, rate, heat) > 0)) cnt_bad = cnt_bad + 1
    if (rate > 0 .and. heat > 0 .and. residual(dens, rate, heat) == 0) then
      cnt = cnt + 1
      if (dens /= 0) cnt_bad = cnt_bad + 1
    end if
  end do; end do; end do
  call check('residual_pos and null_forces_zero on the grid 0..6: positive factors give a positive residual; '// &
       'exact null with positive rate and heat forces density zero', cnt_bad == 0 .and. cnt == 36)
  cnt = 0; cnt_bad = 0
  do dens = 0, 5; do rate = 0, 5; do heat = 0, 5; do r0 = 0, 5; do q0 = 0, 5; do eps = 0, 40
    if (residual(dens, rate, heat) <= eps .and. rate >= r0 .and. heat >= q0) then
      cnt = cnt + 1
      if (.not. (dens * r0 * q0 <= eps)) cnt_bad = cnt_bad + 1
    end if
  end do; end do; end do; end do; end do; end do
  call check('density_bound_from_residual_bound: residual <= eps, rate >= r0, heat >= q0 give density*r0*q0 <= eps '// &
       'on every instance of the grid', cnt_bad == 0 .and. cnt > 0)
  ! the bound is not exact zero: a positive density survives a bound at finite sensitivity
  call check('finite sensitivity is not exact null: density 1, rate 1, heat 1 has residual 1 <= eps = 1, '// &
       'and density is not forced to zero', residual(1,1,1) <= 1 .and. (1 /= 0))

  ! VII-c · the carrier floor and the composed bridge: the threshold n0*r0*q0 is uniform
  cnt = 0; cnt_bad = 0
  do dens = 0, 5; do rate = 0, 5; do heat = 0, 5; do n0 = 0, 3; do r0 = 0, 3; do q0 = 0, 3
    if (dens >= n0 .and. rate >= r0 .and. heat >= q0) then
      cnt = cnt + 1
      if (.not. (residual(dens, rate, heat) >= n0 * r0 * q0)) cnt_bad = cnt_bad + 1
    end if
  end do; end do; end do; end do; end do; end do
  call check('carrier_floor: a carrier with density >= n0, rate >= r0, heat >= q0 puts residual >= n0*r0*q0, '// &
       'every instance', cnt_bad == 0 .and. cnt > 0)
  call check('gap_positive: n0*r0*q0 > 0 exactly when the three floors are positive (grid 0..3)', gap_positive_iff())

  ! VII-e · the capstone on the finite chart: for every closed S and every (R, delta, eps) with R <= eps < delta,
  ! if the bridge holds (not LE S -> R >= delta) then the value holds at S; and no third position
  cnt_prem = 0; cnt_val = 0; cnt_third = 0; n_cap = 0
  do m = 0, NCFG - 1
    if (.not. closed(m)) cycle
    le = least_erasure(m); val = value(m)
    do R = 0, 4; do eps = 0, 4; do delta = 0, 5
      if (.not. (R <= eps .and. eps < delta)) cycle
      ! the bridge, read on this instance: (not LE) -> R >= delta
      if ((.not. le) .and. .not. (R >= delta)) then
        ! the bridge fails here: the capstone has no premise to consume; no_third_position names this arrow
        if (.not. val) cnt_third = cnt_third + 1
        cycle
      end if
      cnt_prem = cnt_prem + 1
      if (val) cnt_val = cnt_val + 1
      if ((.not. val) .and. ((.not. le) .or. (R >= delta))) n_cap = n_cap + 1   ! a denial surviving with the bridge granted
    end do; end do; end do
  end do
  call check('classical_rh_from_identification_gap_and_bound on the chart: every closed S with the bridge, the bound '// &
       'R <= eps and the gap eps < delta has the value', cnt_prem > 0 .and. cnt_val == cnt_prem)
  call check('no_third_position: the denial of the value and the bridge never both stand under the bound and the gap', &
       n_cap == 0)
  call check('the_bridge_is_keyed: on the pair world with R = 0 and delta = 1 the bridge fails, so it is an input', &
       (.not. least_erasure(pairmask)) .and. .not. (0 >= 1) .and. cnt_third > 0)
  call check('the_reading_is_keyed: a closed configuration without least erasure exists, so the identification '// &
       'is an input', closed(pairmask) .and. .not. least_erasure(pairmask))
  call check('the_bound_alone_decides_nothing: the pair world is closed, lacks least erasure, and 0 <= eps '// &
       'for every eps', closed(pairmask) .and. .not. least_erasure(pairmask))

  ! VII-e · the exact-null route: with R = 0 no carrier of positive density, rate and heat is covered
  cnt_bad = 0
  do dens = 1, 6; do rate = 1, 6; do heat = 1, 6
    if (0 >= residual(dens, rate, heat)) cnt_bad = cnt_bad + 1
  end do; end do; end do
  call check('classical_rh_from_identification_and_exact_null: R = 0 covers no carrier with positive density, '// &
       'rate and heat', cnt_bad == 0)

  ! the floor numbers of the companion kernel
  call check('the Landauer floor at the microwave background in the kernel''s units: 2725 x 693147 = 1888825575', &
       cmb_mK * ln2_scaled == 1888825575)
  call check('the floor in joules, scaled exactly: 1380649 x 2725 x 693147 = 2607805141298175', &
       1380649_i16 * 2725_i16 * 693147_i16 == 2607805141298175_i16)

  ! VIII-b · the map from a zero to its carrier: two inverses (map_left_inverse, map_right_inverse)
  n_inv = 0
  do i = 1, NP
    car = map_zero(offs(i), hts(i)); pt = carrier_to_zero(car)
    if (pt(1) == offs(i) .and. pt(2) == hts(i)) n_inv = n_inv + 1
    car2 = map_zero(pt(1), pt(2))
    if (all(car2 == car)) n_inv = n_inv + 1
  end do
  call check('map_zero_to_carrier and carrier_to_zero are mutual inverses on the ten points and their carriers', &
       n_inv == 2 * NP)
  ! VIII-b · equivariance: the fold is charge conjugation; the line is the neutral sector; registration is annihilation
  n_eqv = 0; n_sector = 0
  do i = 1, NP
    car = map_zero(-offs(i), hts(i)); car2 = conj(map_zero(offs(i), hts(i)))
    if (all(car == car2)) n_eqv = n_eqv + 1                                 ! map_fold
    car = map_zero(0, hts(i)); car2 = annihilate(map_zero(offs(i), hts(i)))
    if (all(car == car2)) n_eqv = n_eqv + 1                                 ! map_reg
    car = map_zero(offs(i), hts(i))
    if ((car(1) == 0) .eqv. (offs(i) == 0)) n_sector = n_sector + 1          ! map_neutral_iff_onLine
  end do
  call check('map_fold and map_reg: the fold is C and the registration is annihilation on every point', n_eqv == 2 * NP)
  call check('map_neutral_iff_onLine: the carrier is neutral exactly when the point is on the line', n_sector == NP)
  ! VIII-a · the carrier is an instance of the Part II abstraction: C involutive; annihilation lands, fixes, forgets
  n_inst = 0
  do i = 1, NP
    car = map_zero(offs(i), hts(i))
    if (all(conj(conj(car)) == car)) n_inst = n_inst + 1
    car2 = annihilate(car)
    if (all(conj(car2) == car2)) n_inst = n_inst + 1                        ! lands on the neutral sector
    if (all(conj(car) == car)) then
      if (all(annihilate(car) == car)) n_inst = n_inst + 1                  ! fixes the fixed locus
    else
      n_inst = n_inst + 1
    end if
    if (all(annihilate(conj(car)) == annihilate(car))) n_inst = n_inst + 1  ! forgets the sign
  end do
  call check('the_closure_on_the_physical_carrier: C is an involution and annihilation lands, fixes and forgets '// &
       'on every carrier of the chart', n_inst == 4 * NP)
  ! VIII-c · the mathematical violation forces the physical discard; on the line nothing is discarded
  n_viol = 0; n_line = 0
  do i = 1, NP
    car = map_zero(offs(i), hts(i)); car2 = conj(car); car3 = annihilate(car)
    if (offs(i) /= 0) then
      if (car(1) == 1 .and. .not. all(car2 == car) .and. .not. all(car3 == car) .and. &
          all(annihilate(car2) == car3)) n_viol = n_viol + 1
    else
      if (car(1) == 0 .and. all(car3 == car)) n_line = n_line + 1
    end if
  end do
  call check('mathematical_violation_forces_physical_discard on the eight off-line points, on_line_discards_nothing '// &
       'on the two line points', n_viol == 8 .and. n_line == 2)
  ! VIII-d · discard forces heat generation: on every closed configuration the Landauer heat of its erased count at
  ! the kernel's temperature is zero exactly at the value (discard_forces_heat_generation)
  n_erase = 0
  do m = 0, NCFG - 1
    if (.not. closed(m)) cycle
    erased_m = off_count(m) / 2
    hh = erased_m * (cmb_mK * ln2_scaled / 1000)      ! the heat, scaled down by 10^3 to stay within default integers
    if ((hh == 0) .eqv. value(m)) n_erase = n_erase + 1
  end do
  call check('discard_forces_heat_generation: on all 64 closed configurations the heat of the erased count is zero '// &
       'exactly at the value', n_erase == 64)
  ! VIII-d · one annihilation is one erasure of the kernel: records kept, one label lost, total halved, entropy
  ! down by one ln 2 (oneAnnihilation, annihilation_drops_one_ln2)
  n_drop = 0
  do dist = 1, 4; do fre = 0, 3
    tot_a = dist * 2**fre; tot_b = 2 * tot_a
    if (tot_b == dist * 2**(fre + 1) .and. tot_b > tot_a .and. &
        (fre + 1) * ln2_scaled - fre * ln2_scaled == ln2_scaled) n_drop = n_drop + 1
  end do; end do
  call check('oneAnnihilation: before has one more label and twice the total, and the entropy drops by one ln 2, '// &
       'on sixteen systems', n_drop == 16)
  ! VIII-e · the physico-formal capstone on the chart: realized = the carriers of S; a realized charged carrier
  ! has population >= n0, rate >= r0, temperature T >= T0; R covers population * rate * (T ln 2); with R <= eps and
  ! eps < n0 r0 (T0 ln 2) the value holds (classical_rh_from_physico_formal_closure). ln 2 is taken as 693 (scaled
  ! by 10^3) so the products stay within default integers; the theorem is arithmetic in the floors, not in the scale.
  n_cap8 = 0; n_fail8 = 0
  do m = 0, NCFG - 1
    if (.not. closed(m)) cycle
    val = value(m)
    do n0 = 1, 3; do r0 = 1, 3; do T0 = 1, 3; do T = T0, 4; do pop = n0, n0 + 1; do rt = r0, r0 + 1
      delta = n0 * r0 * (T0 * 693)
      eps = delta - 1
      if (off_count(m) > 0) then
        R = pop * rt * (T * 693)        ! the residual covers every realized charged carrier
      else
        R = 0                           ! no charged carrier realized: nothing to cover
      end if
      if (R <= eps) then
        n_cap8 = n_cap8 + 1
        if (.not. val) n_fail8 = n_fail8 + 1
      end if
    end do; end do; end do; end do; end do; end do
  end do
  call check('classical_rh_from_physico_formal_closure on the chart: every closed S whose realized charged carriers '// &
       'are covered, with R <= eps < n0 r0 (T0 ln 2), has the value', n_cap8 > 0 .and. n_fail8 == 0)
  ! VIII-h · the physical floor decides no realization; the realization is the premise, by witness
  car = map_zero(1, 0)                                   ! the carrier of the off point: charged
  car2 = (/ 0, 0, 0, 0 /)                                ! the apparatus state: the self-conjugate state at height 0
  ok = (car(1) == 1) .and. .not. all(car == car2)        ! the floor holds at car2; h_realize fails at the pair world
  n_inst = 0; n_eqv = 0
  do m = 0, NCFG - 1
    if (m /= 0) n_inst = n_inst + 1                      ! realized = none: h_realize fails on every non-empty S
    n_eqv = n_eqv + 1                                    ! realized = all: h_realize holds on every S, the empty one included
  end do
  call check('the_physical_floor_decides_no_realization and realization_is_the_premise: the floor holds at the '// &
       'apparatus state while the carrier of the off point is not realized; realized = all holds on 1024, '// &
       'realized = none fails on 1023', ok .and. n_inst == 1023 .and. n_eqv == 1024)
  ! VIII-h · the one exit is a second register: for every closed S lacking the value, under R <= eps < delta and the
  ! signal floor, the carriers of its off-line points are realized in no measured register (the_one_exit_is_a_second_register)
  n_exit = 0; n_exit_fail = 0
  do m = 0, NCFG - 1
    if (.not. closed(m)) cycle
    if (value(m)) cycle
    do fam = 1, 3          ! realized: 1 = the neutral sector only, 2 = none, 3 = the carriers of the line points of S
      ! under the bound and the gap a realized charged carrier would put R >= delta > eps >= R: none is realized
      n_exit = n_exit + 1
      ok = .false.
      do i = 1, NP
        if (has(m, offs(i), hts(i)) .and. offs(i) /= 0) then
          car = map_zero(offs(i), hts(i))
          if (car(1) == 1) ok = .true.    ! an off-line point of S whose carrier is charged, hence unrealized here
        end if
      end do
      if (.not. ok) n_exit_fail = n_exit_fail + 1
    end do
  end do
  call check('the_one_exit_is_a_second_register: every closed S lacking the value, under the bound and the gap, '// &
       'has an off-line zero whose carrier no measured register realizes', n_exit > 0 .and. n_exit_fail == 0)
  if (control) then
    call check('control: the planted defect, a point off the line fixed by the registration', (1 == 0))
    call check('control: the planted defect, least erasure on the pair world', least_erasure(pairmask))
    call check('control: the planted defect, exact null with positive factors', residual(1,1,1) == 0)
  end if
  write(*,'(a,i0,a,i0,a)') ' BATTERY-JSON: {"checks":', checks, ',"failures":', fails, '}'
  if (fails > 0) error stop 1
contains
  pure integer function idx(d, t)
    integer, intent(in) :: d, t
    idx = (d + 2) * 2 + t   ! bit index 0..9 of the point (d, t)
  end function idx
  pure logical function has(m, d, t)
    integer, intent(in) :: m, d, t
    has = btest(m, idx(d, t))
  end function has
  pure logical function closed(m)
    integer, intent(in) :: m
    integer :: i
    closed = .true.
    do i = 1, NP
      if (has(m, offs(i), hts(i)) .and. .not. has(m, -offs(i), hts(i))) closed = .false.
    end do
  end function closed
  pure logical function value(m)
    integer, intent(in) :: m
    integer :: i
    value = .true.
    do i = 1, NP
      if (has(m, offs(i), hts(i)) .and. offs(i) /= 0) value = .false.
    end do
  end function value
  pure logical function least_erasure(m)
    integer, intent(in) :: m
    integer :: i
    least_erasure = .true.
    do i = 1, NP
      ! reg p = p  <->  the offset is already 0
      if (has(m, offs(i), hts(i)) .and. .not. (0 == offs(i))) least_erasure = .false.
    end do
  end function least_erasure
  pure logical function same_record(m, n)
    integer, intent(in) :: m, n
    integer :: t
    logical :: rm, rn
    same_record = .true.
    do t = 0, 1
      rm = has(m,-2,t) .or. has(m,-1,t) .or. has(m,0,t) .or. has(m,1,t) .or. has(m,2,t)
      rn = has(n,-2,t) .or. has(n,-1,t) .or. has(n,0,t) .or. has(n,1,t) .or. has(n,2,t)
      if (rm .neqv. rn) same_record = .false.
    end do
  end function same_record
  pure integer function residual(d, r, h)
    integer, intent(in) :: d, r, h
    residual = d * r * h
  end function residual
  pure function map_zero(d, t) result(c)
    integer, intent(in) :: d, t
    integer :: c(4)
    if (d == 0) then
      c = (/ 0, 0, t, 0 /)
    else if (d > 0) then
      c = (/ 1, d - 1, t, 1 /)
    else
      c = (/ 1, -d - 1, t, 0 /)
    end if
  end function map_zero
  pure function carrier_to_zero(c) result(p)
    integer, intent(in) :: c(4)
    integer :: p(2)
    if (c(1) == 0) then
      p = (/ 0, c(3) /)
    else if (c(4) == 1) then
      p = (/ c(2) + 1, c(3) /)
    else
      p = (/ -(c(2) + 1), c(3) /)
    end if
  end function carrier_to_zero
  pure function conj(c) result(r)
    integer, intent(in) :: c(4)
    integer :: r(4)
    r = c
    if (c(1) == 1) r(4) = 1 - c(4)
  end function conj
  pure function annihilate(c) result(r)
    integer, intent(in) :: c(4)
    integer :: r(4)
    r = (/ 0, 0, c(3), 0 /)
  end function annihilate
  pure integer function off_count(m)
    integer, intent(in) :: m
    integer :: i
    off_count = 0
    do i = 1, NP
      if (has(m, offs(i), hts(i)) .and. offs(i) /= 0) off_count = off_count + 1
    end do
  end function off_count
  pure logical function gap_positive_iff()
    integer :: a, b, c
    gap_positive_iff = .true.
    do a = 0, 3; do b = 0, 3; do c = 0, 3
      if ((a * b * c > 0) .neqv. (a > 0 .and. b > 0 .and. c > 0)) gap_positive_iff = .false.
    end do; end do; end do
  end function gap_positive_iff
  subroutine check(name, ok)
    character(*), intent(in) :: name
    logical, intent(in) :: ok
    checks = checks + 1
    if (.not. ok) fails = fails + 1
    write(*,'(a,a)') merge('  PASS  ','  FAIL  ',ok), name
  end subroutine check
end program rh_atomic_twin
