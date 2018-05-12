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
  
  # class Scope < Scope
    def resolve
      super
    end    
        
    def resolve_admin
      scope.where(owner: user.user_detail)
    end
    
  # end
  
 end
 
 