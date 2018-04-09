module AppOwnerHelper
  
  class PolicyDummy < AppOwnerPolicy
  #  Dummy usage instruction  
  # all the `set_` method only call to `make_` method if not set already
  #  No need to sign in user - as controller class calls authorize to 
  #  ...punidt already

    attr_accessor :user, :user_details, :location, 
      :target_name, :pet_category, :pet

    def initialize(target_name = nil)
      sanitize_name 
      set_user
      set_user_detail
      set_location
      set_pet_category
      set_pet
    end
    
    # Can only provision one user with defaultname
    def provision_user(name = default_user_name)
      @target_name = name
      @user = make_user
      @user_details = make_user_detail
    end
    
    # -- TODO -- shouldn't be admin'ing stuff for giggles
    def provision_admin(name = default_admin_name)
      provision_user(name)
      @user_details.update(admin: true)
    end
    
    def sanitize_name
      if @target_name
        @target_name = @target_name.tr("\n\t\s", '_').downcase
      else
        @target_name = default_user_name
      end
      
    end
    
    def default_user_name
      "A_User"
    end
    
    def default_admin_name
      "An_Admin"
    end
    
    def increment_name
      @target_name = "#{@target_name}#{User.count}"
    end
    
    def set_user
      @user ||=  make_user
    end
    
    def make_user
      increment_name
      sanitize_name
      email = "#{@target_name}@test.com"
      User.create!(email: email) do  
        |user| user.password = 'ssssss' 
      end
    end
  
    def set_user_detail
      @user_details ||= @user_details = make_user_detail
    end
    
    def make_user_detail
      UserDetail.find_by(user_id: @user) || @user.create_user_detail!(name: @target_name)
    end
    
    def set_location
      a_name = "#{@target_name}'s Al-passo"
      @location ||= Location.find_or_create_by!(name: a_name ) do 
          |loc| loc.user_detail_id = @user.user_detail.id 
        end
    end
    
    def set_pet_category
      @pet_category ||= PetCategory.find_or_create_by!(name: "Animal")
    end 
    
    def set_pet
     @pet ||= @user_details.pets.create!(
        name: "test", 
        location_id: @location.id, 
        pet_category_id: @pet_category.id)
    end
      
    def not_authorized_as?(subject)
      not_authorized unless subject
    end
    
    def not_authorized
      raise not_authorized_error
    end
  
    def not_authorized_error(subject = "Pundit")
        (subject + "::NotAuthorizedError").constantize
    end
  end
end