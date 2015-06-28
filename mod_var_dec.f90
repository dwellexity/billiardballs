module mod_var_dec
  implicit none
  public
  integer, parameter :: n = 10
  real, dimension(3,n) :: xyz,vel,acc,tempacc
  real, dimension(3), parameter :: boxlen = [10.0, 10.0, 10.0]
  real, parameter :: mnscl = 1.0e-3
  real, parameter :: eps = 1.0
  real, parameter :: sigma = 1.0
  real, parameter :: Kb = 1.0 !1.3806488e-23
  real, parameter :: Pi = 4.0*atan(1.0)
  real, parameter :: rad =  0.5
  real, parameter :: mindist = 2*rad
  real, parameter :: m=1.0
  real, parameter :: tot_t = 1000.0
  real, parameter :: dt = 0.001
  real :: ke =10000.0
  real :: pe,te
end module mod_var_dec
