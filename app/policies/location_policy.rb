class LocationPolicy < AppOwnerPolicy

  class Scope < Scope
   
   def resolve
    if user&.admin?
     scope.all
    else
     scope.where(active: true)
    end
   end
   
  end
  

end