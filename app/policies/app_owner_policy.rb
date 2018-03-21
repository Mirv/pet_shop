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
   userAdminMod?
  end
  
  # def create?
  # end
  

  # private
    def owner_check?
     record.user_detail_id == user.id
    end

    def moderator?
     user.moderator
    end

    def admin?
      user.admin
    end

    def userAdminMod?
      if owner_check? || admin? || moderator?
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