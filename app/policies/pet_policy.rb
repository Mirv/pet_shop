   class PetPolicy < ApplicationPolicy
     def update?
       user.admin? || user.moderator? || record.try(:user) == user
     end
     
     def admin?
       user.admin
     end
     
     def moderator?
       user.moderator
     end
   end