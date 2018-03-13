class LocationPolicy < AppOwnerPolicy
  def update?
   raise Pundit::NotAuthorizedError unless userAdminMod?
  end

  def show?
   userAdminMod?
  end
  
  def new?
   user
  end
  
  def edit
   update?
  end
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