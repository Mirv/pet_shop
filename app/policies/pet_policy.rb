 class PetPolicy < AppOwnerPolicy
  
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
  
  class Scope < Scope
    def resolve
      # super
      scope
    end    
        
    def resolve_admin
     #works pre tweaks to scopes for location / pets included in app_owner_policy
      scope.where(user_detail: user.user_detail)

        # scope
      end
    
  end
  
 end
 
 