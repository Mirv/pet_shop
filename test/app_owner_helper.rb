module AppOwnerHelper
  
  class PolicyDummy < AppOwnerPolicy
  #  Dummy usage instruction  
  # all the `set_` method only call to `make_` method if not set already
  #  No need to sign in user - as controller class calls authorize to 
  #  ...punidt already

    attr_accessor :user, :user_details, :location, 
      :target_name, :pet_category, :pet

    def initialize(target_name = nil)
      @target_name = sanitize_name(target_name) || "A_user"
      set_user
      set_user_detail
      set_location
      set_pet_category
      set_pet
    end
    
    def sanitize_name(target_name)
      target_name.tr("\n\t", '_').tr(' ','').downcase
    end
    
    def set_user
      @user ||= @user = make_user
    end
    
    def make_user
      User.find_or_create_by!(email: "#{sanitize_name(@target_name)}@test.com") do  
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
      @location ||= @location = Location.find_or_create_by!(
        name: "#{@target_name}'s Al-passo") do 
          |loc| loc.user_detail_id = @user.user_detail #.id 
        end
    end
    
    def set_pet_category
      @pet_category = PetCategory.find_or_create_by!(name: "Animal")
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