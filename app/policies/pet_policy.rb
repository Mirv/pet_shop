 class PetPolicy < AppOwnerPolicy

  class Scope < Scope
   
   def resolve
    if user&.user_detail&.admin
     scope.all
    else
     scope.where(published: true)
    end
   end
   
  end


 end