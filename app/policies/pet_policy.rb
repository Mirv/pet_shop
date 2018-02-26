 class PetPolicy < ApplicationPolicy
  def update?
   userAdminMod?
  end

  def show?
   owner_check?
  end
  
  def new?
   user
  end

 end