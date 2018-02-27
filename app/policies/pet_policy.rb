 class PetPolicy < AppOwnerPolicy
  def update?
   userAdminMod?
  end

  def show?
   owner_check?
  end
  
  def new?
   user
  end

  class Scope < Scope
   
   def resolve
    if user&.admin?
     scope.all
    else
     scope.where(published: true)
    end
   end
   
  end

 end