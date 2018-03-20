module AppOwnerHelper
  
  attr_reader :user, :user_details
  
  def call_setup
    @user = set_user
    set_user_detail(@user)
  end
  
  def set_user
    @user ||= User.find_or_create_by(email: "atrox@test.com") { |user| user.password = 'ssssss' }
  end

  def set_user_detail(user = @user)
    @user_details ||= user.create_user_detail(name: "Atrox")
  end
  
  def set_location
    # @location = Location.create(name: "Al-passo",  user_detail_id: @user)
    @location = Location.create(name: "Al-passo")
  end
  
  def set_pet_category(user = set_user)
    @pet_category = PetCategory.create(name: "Animal", user_detail_id: @user)
  end 
  
  def set_pet(user_details = set_user_detail)
    user_details.pets.build(
      name: "test", 
      location_id: set_location, 
      pet_category_id: set_pet_category)
  end
end