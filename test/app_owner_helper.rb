module AppOwnerHelper
  
  class PolicyDummy < AppOwnerPolicy
    # all the `set_` method only call to `make_` method if not set already
    attr_accessor :user, :user_details, :location, 
      :target_name, :pet_category, :pet
    
      # @user = set_user
      # @user_details = set_user_detail
      # @location = set_location

    def initialize(target_name = nil)
      @target_name = target_name || "atrox"
      set_user
      set_user_detail
      set_location
      set_pet_category
      set_pet
    end
    
    def set_user
      @user ||= make_user
      # make_user
    end
    
    def make_user
      @user = User.find_or_create_by(email: "#{@target_name}@test.com") { 
        |user| user.password = 'ssssss' }
    end
  
    def set_user_detail
      @user_details ||= UserDetail.find_by(user_id: @user) || 
      @user.create_user_detail!(name: @target_name)
    end
    
    def set_location
      @location ||= @location = Location.find_or_create_by!(name: "Al-passo") do 
        |loc| loc.user_detail_id = @user.user_detail.id end
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

  end
end