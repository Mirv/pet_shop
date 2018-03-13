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
   raise Pundit::NotAuthorizedError unless owner_check? || admin? || moderator? 
  end
  
  def not_authorized_as?(subject)
    raise Pundit::NotAuthorizedError unless subject
  end
  
  def not_authorized
    raise Pundit::NotAuthorizedError
  end
  
  def not_authorized(subject = "Pundit")
    (subject + "::NotAuthorizedError").constantize
  end
  
end