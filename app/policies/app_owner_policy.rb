class AppOwnerPolicy < ApplicationPolicy 
  def admin?
    user.admin
  end
  
  def update?
  end
  
  def moderator?
    user.moderator
  end
  
  def owner_check?
   record.user_detail_id == user.id
  end
  
  def userAdminMod?
   not_authorized unless owner_check? || admin? || moderator? 
  end
  
  def not_authorized_as?(subject)
    not_authorized unless subject
  end
  
  def not_authorized
    raise Pundit::NotAuthorizedError
  end

  
  def not_authorized(subject = "Pundit")
    (subject + "::NotAuthorizedError").constantize
  end
  
end