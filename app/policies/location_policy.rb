class LocationPolicy < AppOwnerPolicy

  class Scope < Scope
   
   def resolve
    if user&.admin?
     scope.all
    else
     scope.where(visible: true)
    end
   end
   
  end
  

end