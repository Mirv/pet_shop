module AppOwnerHelper
  
  class PolicyDummy < AppOwnerPolicy
    attr_accessor :user, :user_details, :location, :target_name, :pet_category
    
    def initialize(target_name = nil)
      @target_name = target_name || "atrox"
      @user = set_user
      @user_details = set_user_detail
      @location = set_location
      
      
      # byebug
    end
    
    def set_user
      # @user ||= make_user
       make_user
    end
    
    def make_user
      @user = User.find_or_create_by(email: "#{@target_name}@test.com") { 
        |user| user.password = 'ssssss' }
    end
  
    def set_user_detail
      @user_details ||= UserDetail.find_by(user_id: @user) || @user.create_user_detail!(name: @target_name)
    end
    
    def set_location
      @location ||= @location = Location.find_or_create_by!(name: "Al-passo") do |loc| loc.user_detail_id = @user end
    end
    
    def set_pet_category
      # @pet_category = PetCategory.create(name: "Animal", user_detail_id: @user)
      @pet_category = PetCategory.find_or_create_by!(name: "Animal")
    end 
    
    def set_pet
      pet_category = set_pet_category
      @user_details.pets.create!(
        name: "test", 
        location_id: set_location, 
        pet_category_id: pet_category)
    end
    
    def setup_dummy
      # initalize does the name/user/details
      # set_pet_category
      set_location
      puts @location
      
    end
  end
end