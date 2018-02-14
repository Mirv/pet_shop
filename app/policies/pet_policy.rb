   class PetPolicy < ApplicationPolicy
     def update?
       userAdminMod?
     end
     
     def show?
      userAdminMod?
      # @user
     end
     
     def new?
       @user
     end
     
     def admin?
       user.admin
     end
     
     def moderator?
       user.moderator
     end
     
     private
     
      def userAdminMod?
        user.admin? || user.moderator? || record.try(:user) == user
      end
   end