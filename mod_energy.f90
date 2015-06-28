module mod_energy
  use mod_var_dec, only: vel,m,ke
  implicit none
  private
  public :: kinetic
contains
  subroutine kinetic()
    implicit none
    ke=0.5*m*sum(vel*vel)
  end subroutine kinetic
end module mod_energy
