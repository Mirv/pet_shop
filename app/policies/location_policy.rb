class LocationPolicy < AppOwnerPolicy
  # byebug
  class Scope < Scope
    def resolve
      scope
      # scope.where(active: true)
    end
        
    def resolve_admin
      scope.where(user_detail_id: user.user_detail)
    end 
  end
end