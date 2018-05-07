class LocationPolicy < AppOwnerPolicy

  class Scope < Scope
   def resolve
    if user&.user_detail&.admin == true
     scope.all
    else
     scope.where(active: true)
    end
   end
   
  end
  

end