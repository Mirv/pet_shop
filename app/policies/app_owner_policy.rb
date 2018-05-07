class AppOwnerPolicy < ApplicationPolicy 

  class Scope < Scope
    def resolve
      if user&.user_detail&.admin
      # if admin?
       scope.all
      else
        scope
      end
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

end