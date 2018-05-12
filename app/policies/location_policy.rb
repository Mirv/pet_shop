class LocationPolicy < AppOwnerPolicy

  class Scope < Scope
  # def resolve
  #   if user&.user_detail&.admin
  #   scope.all
  #   else
  #   scope.where(active: false)
  #   end
  # end
      
  def resolve_admin
    # scope.where(user_detail_id: user.user_detail)
    scope.where(user_detail_id: user.user_detail)
  end 
   
  
  end
  

end