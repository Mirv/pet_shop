 class PetCategoryPolicy < AppOwnerPolicy
  
  def index?
    true
  end

  def show?
    scope.where(:id => record.id).exists?
    # scope.all
    # true
  end
  
  def new?
    user
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
  
  def owner_check?
    # record.id == user.id
    true
  end
  
  class Scope < Scope
    def resolve
      scope
    end    
        
    def resolve_admin
      scope.all
    end
    
  end
  
 end
 
 