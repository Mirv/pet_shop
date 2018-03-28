class AppOwnerPolicy < ApplicationPolicy 

  # def create?
  # end
  class Scope < Scope
   
   def resolve
    if user&.user_detail&.admin
     scope.all
    else
     scope.where(published: true, visible: true)
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


end