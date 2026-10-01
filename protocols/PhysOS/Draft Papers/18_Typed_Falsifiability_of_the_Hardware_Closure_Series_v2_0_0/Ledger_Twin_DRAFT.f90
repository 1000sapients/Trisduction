! Ledger_Twin.f90 · the executed twin of SPHYS_Typed_Falsifiability.lean · Fortran 2018.
! Build (sealed): gfortran -std=f2018 -O2 -fno-fast-math -ffp-contract=off Ledger_Twin.f90
! Reads ledger.dat (code|target|theorem|engine file|paper), one line per falsifier, and the engines in
! the directory engines/: the sixteen hardware-series engines and the hardware paper's, as built, and
! the six witnesses' engines as printed in their published editions (Zenodo 10.5281/zenodo.22986553
! through .22986563). For every falsifier bound to a theorem it confirms the theorem is declared in its
! engine; it recounts the ledger's census by target and by paper.
program ledger_twin
  implicit none
  integer, parameter :: maxl = 100
  character(len=400) :: line
  character(len=40) :: code(maxl), tgt(maxl)
  character(len=80) :: thm(maxl), fil(maxl)
  character(len=120) :: pap(maxl)
  integer :: n, ios, i, p1, p2, p3, p4, nfound, nbound, checks, fails
  integer :: cl, cf, cw, cpo, cc, cpr, j, np, cnt, okp
  character(len=120) :: plist(maxl)
  logical :: seen
  checks = 0; fails = 0; n = 0
  open(10, file='ledger.dat', status='old', action='read')
  do
    read(10, '(a)', iostat=ios) line
    if (ios /= 0) exit
    if (len_trim(line) == 0) cycle
    n = n + 1
    p1 = index(line, '|'); p2 = p1 + index(line(p1+1:), '|'); p3 = p2 + index(line(p2+1:), '|')
    p4 = p3 + index(line(p3+1:), '|')
    code(n) = line(1:p1-1); tgt(n) = line(p1+1:p2-1); thm(n) = line(p2+1:p3-1)
    fil(n) = line(p3+1:p4-1); pap(n) = line(p4+1:)
  end do
  close(10)
  write(*,'(a,i0,a)') 'A · the ledger read: ', n, ' falsifiers'
  nbound = 0; nfound = 0
  do i = 1, n
    if (trim(thm(i)) == '-') cycle
    nbound = nbound + 1
    if (declared(trim(fil(i)), trim(thm(i)))) then
      nfound = nfound + 1
    else
      write(*,'(a,a,a,a)') '  MISSING ', trim(thm(i)), ' in ', trim(fil(i))
    end if
  end do
  write(*,'(a,i0,a,i0)') '  theorems bound: ', nbound, ' ; declared in their engines: ', nfound
  call check('64 falsifiers; 58 bound to a theorem, every one declared in its engine', &
             n == 64 .and. nbound == 58 .and. nfound == 58)
  cl = 0; cf = 0; cw = 0; cpo = 0; cc = 0; cpr = 0
  do i = 1, n
    select case (trim(tgt(i)))
    case ('line'); cl = cl + 1
    case ('fold'); cf = cf + 1
    case ('wall'); cw = cw + 1
    case ('positivity'); cpo = cpo + 1
    case ('count'); cc = cc + 1
    case ('price'); cpr = cpr + 1
    end select
  end do
  write(*,'(a,6i4)') 'B · census by target (line fold wall positivity count price): ', cl, cf, cw, cpo, cc, cpr
  call check('the census matches the engine: 18, 13, 11, 9, 8, 5', cl == 18 .and. cf == 13 .and. cw == 11 .and. &
             cpo == 9 .and. cc == 8 .and. cpr == 5)
  np = 0
  do i = 1, n
    seen = .false.
    do j = 1, np
      if (trim(plist(j)) == trim(pap(i))) seen = .true.
    end do
    if (.not. seen) then
      np = np + 1; plist(np) = pap(i)
    end if
  end do
  okp = 0
  do j = 1, np
    cnt = 0
    do i = 1, n
      if (trim(pap(i)) == trim(plist(j))) cnt = cnt + 1
    end do
    if (cnt >= 2 .and. cnt <= 4) okp = okp + 1
  end do
  write(*,'(a,i0,a)') 'C · ', np, ' papers'
  call check('22 papers, each carrying two to four falsifiers', np == 22 .and. okp == 22)
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
  logical function declared(fname, tname) result(found)
    character(*), intent(in) :: fname, tname
    character(len=2000) :: buf
    integer :: u, ios2, k, e
    found = .false.
    open(newunit=u, file='engines/'//fname, status='old', action='read', iostat=ios2)
    if (ios2 /= 0) return
    do
      read(u, '(a)', iostat=ios2) buf
      if (ios2 /= 0) exit
      k = index(buf, 'theorem '//tname)
      if (k > 0) then
        e = k + 8 + len(tname)
        if (e > len_trim(buf)) then
          found = .true.
        else if (buf(e:e) == ' ' .or. buf(e:e) == '(' .or. buf(e:e) == ':' .or. buf(e:e) == '{') then
          found = .true.
        end if
      end if
      if (found) exit
    end do
    close(u)
  end function declared
end program ledger_twin
