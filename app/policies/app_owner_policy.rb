class AppOwnerPolicy < ApplicationPolicy 

  class Scope < Scope
    def resolve
      scope
      # scope.where(visible: true)
    end
    
    # necessary to make the administrate panel work
    def resolve_admin
      scope
    end
  end
  
  def index? 
    true
  end
  
  def show?
    scope.where(:id => record.id).exists?
  end
  
  def new?
    create?
  end
  
  def create?
    user
  end
  
  def edit?
    update?
  end
  
  def update?
    userAdmin?
  end

  def owner_check?
    # byebug
    record.user_detail_id == user&.id
  end

  def admin?
    user&.admin  # gracefully fails, but allows access when shouldn't
  end

  def userAdmin?
    if owner_check? || admin? 
      true
    else
      # byebug
      # not_authorized
      # raise Pundit::NotAuthorizedError, "Not authorized at AppOwnerPolicy#userAdmin?"
      false
    end
  end

end