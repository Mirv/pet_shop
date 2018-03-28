class AppOwnerPolicy < ApplicationPolicy 

  def index?
    true
  end

  def show?
   true
  end
  
  def new?
   user
  end
  
  def edit?
   update?
  end
  
  def update?
   userAdmin?
  end
  
  # def create?
  # end
  class Scope < Scope
   
   def resolve
    if user&.user_detail&.admin
     scope.all
    else
     scope.where(published: true)
    end
   end
   
  end

  def owner_check?
   record.user_detail_id == user.id
  end

  def admin?
    user.admin
  end

  def userAdmin?
    if owner_check? || admin? 
        true
    else
        not_authorized
    end
  end
  
  def not_authorized_as?(subject)
    not_authorized unless subject
  end
  
  def not_authorized
    raise not_authorized_error
  end

  def not_authorized_error(subject = "Pundit")
      (subject + "::NotAuthorizedError").constantize
  end

end