 class PetPolicy < AppOwnerPolicy

  class Scope < Scope
   
   def resolve
    if user&.admin?
     scope.all
    else
     scope.where(published: true)
    end
   end
   
  end
   def not_authorized_error(subject = "Pundit")
    # (subject + "::NotAuthorizedError").constantize
    Pundit::NotAuthorizedError

   end

 end