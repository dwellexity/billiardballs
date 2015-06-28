module mod_mol_dyn
  use mod_var_dec, only : m,n,xyz,vel,acc,eps,sigma,dt,boxlen,rad
  implicit none
  private
  real, dimension(3) :: dist
  public :: pos_upd,vel_upd
contains
  subroutine pos_upd()
    implicit none
    integer :: i,k
    do i=1,n
      do k=1,3
        xyz(k,i)=xyz(k,i) + (vel(k,i)*dt)
      enddo
    enddo
  end subroutine pos_upd
  !Updating Velocity
  subroutine vel_upd()
    implicit none
    integer :: i,j,k
    real :: r,temp1,temp2
    do i=1,n-1
      do j=i+1,n
        dist=xyz(:,i)-xyz(:,j)
        r=sqrt(sum(dist**2))
        if(r<=2*rad) then
          temp1=dot_product((vel(:,i)-vel(:,j)),(xyz(:,i)-xyz(:,j)))
          temp2=dot_product((xyz(:,i)-xyz(:,j)),(xyz(:,i)-xyz(:,j)))
          do k=1,3
            vel(k,i)=vel(k,i)-(temp1*(xyz(k,i)-xyz(k,j))/temp2)
            vel(k,j)=vel(k,j)-(temp1*(xyz(k,j)-xyz(k,i))/temp2)
          enddo
        endif
      enddo
    enddo
    do i=1,n
      do k=1,3
        if(xyz(k,i)>boxlen(k)-rad) then
          vel(k,i)=-vel(k,i)  !RBC
        elseif(xyz(k,i)<rad) then
          vel(k,i)=-vel(k,i)  !RBC
        endif
      enddo
    enddo
  end subroutine vel_upd
end module mod_mol_dyn
