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
  
  def show_link?
    
  end
  
  class Scope < Scope
    def resolve
      # scope
      # scope.where(pet_category_id: 980191006)
      # scope.where(pet_status: :published)
      scope.published
    end    
        
    def resolve_admin
      # scope

      #works pre tweaks to scopes for location / pets included in app_owner_policy
      # administrate can list entries, but can't open records for them
      # ... shouldn't it not list them if they aren't owned by user_detail?
      scope.where(user_detail: user.user_detail)
    end
  end

 end
 
 