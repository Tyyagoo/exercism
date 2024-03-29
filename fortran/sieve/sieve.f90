module sieve
  implicit none

contains

  function primes(limit) result(array)
    integer, intent(in) :: limit
    integer, allocatable :: array(:)
    logical, allocatable :: elems(:)
    integer :: X, i, j, mx

    if (limit < 2) then
      array = [ integer :: ]
      return
    end if

    allocate(array(limit - 1))
    allocate(elems(limit - 1), source=.true.)
    array = (/ (X, X = 2, limit) /)
    mx= int(sqrt(real(limit)))

    iloop: do i = 2, mx 
      if (elems(i - 1)) then
        jloop: do j = i * i, limit, i
          elems(j - 1) = .false.
        end do jloop
      end if
    end do iloop

    array = pack(array, elems)
  end function primes

end module sieve
