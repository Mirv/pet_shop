 class PetPolicy < ApplicationPolicy
  def update?
   # user.admin? || user.moderator? || record.try(:user) == user

  end
  
  def owner_check?
   record.user_detail_id == user.user_detail.first.user_id
   # true
  end
  
  def show?
   # userAdminMod?
   # @user
   # user.admin? || user.moderator? || record.try(:user) == user
   # record.user_detail_id == user.user_detail.first.user_id
   owner_check?
  end
  
  def new?
   user
  end
  
  def admin?
   # user.admin
  end
  
  def moderator?
    user.moderator
  end
  
  private

   def userAdminMod?
     user.admin? || user.moderator? || record.try(:user) == user
     @record.user == @user
      # record.try(:user) == user
   end
   

 end