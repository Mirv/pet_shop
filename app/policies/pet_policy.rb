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
     if user.admin
       scope.all
     else
       scope.where(published: true)
     end
   end
 end

end