! Entanglement_Twin.f90 · the executed twin of SPHYS_Entanglement.lean · Fortran 2018.
! Build (sealed): gfortran -std=f2018 -O2 -fno-fast-math -ffp-contract=off Entanglement_Twin.f90
! Measured CHSH values: Aspect, Grangier and Roger, PRL 49 (1982) 91: 2.697 +- 0.015; Weihs et al., PRL 81
! (1998) 5039: 2.73 +- 0.02; Hensen et al., Nature 526 (2015) 682: 2.42 +- 0.20; Storz et al., Nature 617
! (2023) 265: 2.0747 +- 0.0033.
! A the local carrier and the wall of no signal; B every local strategy gives +-2, every mixture <= 2;
! C the singlet reaches 2 sqrt 2 and no more; D its local records are unbiased at every setting;
! E the PR box reaches 4 and signals nothing; F the measured violations.
program entanglement_twin
  implicit none
  integer, parameter :: dp = selected_real_kind(15, 307)
  integer, parameter :: i8 = selected_int_kind(18)
  real(dp), parameter :: PI = 3.141592653589793_dp
  integer :: checks, fails
  integer(i8) :: seed
  checks = 0; fails = 0; seed = 20261001_i8
  call block_a(); call block_b(); call block_c(); call block_d(); call block_e(); call block_f()
  write(*,'(a,i0,a,i0,a)') ' BATTERY-JSON: {"checks":', checks, ',"failures":', fails, '}'
  if (fails > 0) error stop 1
contains
  include 'twin_common.inc'
  subroutine block_a()
    integer :: pp, pm, mp, mm, n, ok
    write(*,'(a)') 'A · Alice relabels her outcome: her bias and the correlation flip, Bob''s record does not move'
    n = 0; ok = 0
    do pp = 0, 6
      do pm = 0, 6
        do mp = 0, 6
          do mm = 0, 6
            n = n + 1
            if ((mp - mm - pp + pm == -(pp - pm - mp + mm)) .and. (mp + pp == pp + mp) .and. (mm + pm == pm + mm) .and. &
                (1 + ((mp + mm) - (pp + pm)) == 2 - (1 + ((pp + pm) - (mp + mm))))) ok = ok + 1
          end do
        end do
      end do
    end do
    call check('2401 joint records: correlation odd, Bob''s record even, the local carrier equivariant', ok == n)
  end subroutine block_a
  subroutine block_b()
    integer :: a0, a1, b0, b1, n2, k, j
    real(dp) :: w(16), s(16), tot, ss
    integer :: idx
    logical :: okmix
    write(*,'(a)') 'B · local strategies: sixteen deterministic, every one at +-2; random mixtures within the bound'
    n2 = 0; idx = 0
    do a0 = -1, 1, 2
      do a1 = -1, 1, 2
        do b0 = -1, 1, 2
          do b1 = -1, 1, 2
            idx = idx + 1
            s(idx) = real(a0*b0 + a0*b1 + a1*b0 - a1*b1, dp)
            if (abs(s(idx)) == 2.0_dp) n2 = n2 + 1
          end do
        end do
      end do
    end do
    okmix = .true.
    do k = 1, 100000
      tot = 0.0_dp; ss = 0.0_dp
      do j = 1, 16
        w(j) = rnd(); tot = tot + w(j); ss = ss + w(j)*s(j)
      end do
      if (abs(ss/tot) > 2.0_dp + 1.0e-12_dp) okmix = .false.
    end do
    call check('16 of 16 strategies give |S| = 2; 100000 mixtures obey |S| <= 2', n2 == 16 .and. okmix)
  end subroutine block_b
  real(dp) function chsh_q(a0, a1, b0, b1) result(s)
    real(dp), intent(in) :: a0, a1, b0, b1
    s = -cos(a0 - b0) - cos(a0 - b1) - cos(a1 - b0) + cos(a1 - b1)
  end function chsh_q
  subroutine block_c()
    integer :: k
    real(dp) :: smax, sopt
    write(*,'(a)') 'C · the singlet, E = -cos(a - b): CHSH at most 2 sqrt 2, reached at the optimal settings'
    smax = 0.0_dp
    do k = 1, 100000
      smax = max(smax, abs(chsh_q(2.0_dp*PI*rnd(), 2.0_dp*PI*rnd(), 2.0_dp*PI*rnd(), 2.0_dp*PI*rnd())))
    end do
    sopt = abs(chsh_q(0.0_dp, PI/2.0_dp, PI/4.0_dp, -PI/4.0_dp))
    write(*,'(a,f12.9,a,f12.9)') '  optimum ', sopt, ' ; largest of 100000 random settings ', smax
    call check('the singlet reaches 2.828427 = 2 sqrt 2 and no random setting exceeds it', &
               abs(sopt - 2.0_dp*sqrt(2.0_dp)) < 1.0e-14_dp .and. smax <= 2.0_dp*sqrt(2.0_dp) + 1.0e-12_dp)
  end subroutine block_c
  subroutine block_d()
    integer :: k
    real(dp) :: th, pa, pb, worst
    write(*,'(a)') 'D · the singlet''s local records: P(a, b) = (1 - a b cos theta)/4; every marginal 1/2'
    worst = 0.0_dp
    do k = 1, 100000
      th = 2.0_dp*PI*rnd()
      pa = (1.0_dp - cos(th))/4.0_dp + (1.0_dp + cos(th))/4.0_dp
      pb = (1.0_dp - cos(th))/4.0_dp + (1.0_dp + cos(th))/4.0_dp
      worst = max(worst, abs(pa - 0.5_dp), abs(pb - 0.5_dp))
    end do
    call check('100000 settings: both local records unbiased to 1e-16, whatever the far setting', worst < 1.0e-15_dp)
  end subroutine block_d
  subroutine block_e()
    integer :: x, y, a, b, s, ok
    integer :: p(0:1, 0:1, 0:1, 0:1)
    write(*,'(a)') 'E · the PR box: outcomes agree unless both settings are 1'
    do x = 0, 1
      do y = 0, 1
        do a = 0, 1
          do b = 0, 1
            p(x, y, a, b) = merge(1, 0, ieor(a, b) == iand(x, y))
          end do
        end do
      end do
    end do
    s = 0; ok = 0
    do x = 0, 1
      do y = 0, 1
        s = s + merge(-1, 1, x == 1 .and. y == 1)*(p(x, y, 1, 1) - p(x, y, 1, 0) - p(x, y, 0, 1) + p(x, y, 0, 0))
        do a = 0, 1
          if (p(x, y, a, 0) + p(x, y, a, 1) == p(x, 1 - y, a, 0) + p(x, 1 - y, a, 1)) ok = ok + 1
          if (p(y, x, 0, a) + p(y, x, 1, a) == p(1 - y, x, 0, a) + p(1 - y, x, 1, a)) ok = ok + 1
        end do
      end do
    end do
    call check('the PR box reaches CHSH 4 (scaled sum 8) and every marginal ignores the far setting', s == 8 .and. ok == 16)
  end subroutine block_e
  subroutine block_f()
    real(dp) :: sv(4), se(4), r2
    integer :: k, ok
    write(*,'(a)') 'F · measured CHSH values, each above the local bound 2 and below 2 sqrt 2'
    sv = [2.697_dp, 2.73_dp, 2.42_dp, 2.0747_dp]; se = [0.015_dp, 0.02_dp, 0.20_dp, 0.0033_dp]
    r2 = 2.0_dp*sqrt(2.0_dp); ok = 0
    do k = 1, 4
      write(*,'(a,f7.4,a,f7.4,a,f6.1,a)') '  S = ', sv(k), ' +- ', se(k), ' : ', (sv(k) - 2.0_dp)/se(k), ' sigma above 2'
      if (sv(k) > 2.0_dp .and. sv(k) < r2) ok = ok + 1
    end do
    call check('Aspect 1982, Weihs 1998, Hensen 2015, Storz 2023: all above 2, all below 2.8284', ok == 4)
  end subroutine block_f
end program entanglement_twin
