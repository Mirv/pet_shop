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
  
  
  
 end