require 'test_helper'
require 'app_owner_helper' # located in app/policy

class PetsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  include Pundit
  include AppOwnerHelper

  setup do
    @user = set_user
    @user_details = set_user_detail
    @pet_category = set_pet_category
    @location = set_location
    sign_in(@user)

    @pet = @user_details.pets.build(name: "Test", pet_category: @pet_category,
    location: @location, published: true, visible: true, available: true)
  end

  test "should get index" do
    get pets_url
    assert_response :success
  end

  test "should show pet" do
    @pet.save!
    get pet_url(@pet)
    assert_response :success
  end

  test "should get new" do
    get new_pet_url
    assert_response :success
  end

  test "should create pet" do
    assert_difference('Pet.count') do
      post pets_url, params: { pet: { description: @pet.description, 
      location_id: @pet.location_id, name: @pet.name, pet_category_id: @pet.pet_category_id } }
    end

    assert_redirected_to pet_url(Pet.last)
  end
  
  test "should get edit" do
    @pet.save!
    get edit_pet_url(@pet)
    assert_response :success
  end

  test "should not get edit if not Owner Admin Mod" do
    @pet.save!
    sign_out(@user)
    @not_owner = User.create!(email: "blah@test.com", password: "ssssss")
    @details = @not_owner.create_user_detail!(name: "blahta")
    sign_in @not_owner
    
    assert_raise Pundit::NotAuthorizedError do
      patch pet_url(@pet), params: { pet: { description: @pet.description, 
      location_id: @pet.location_id, name: @pet.name, pet_category_id: @pet.pet_category_id } }
    end
    # assert_redirected_to root_url, "Failed to block access to editing"
  end

  test "should update pet" do
    @pet.save!
    patch pet_url(@pet), params: { pet: { description: @pet.description, 
    location_id: @pet.location_id, name: @pet.name, pet_category_id: @pet.pet_category_id } }
    assert_redirected_to pet_url(@pet)
  end

  test "should not update if not Owner Admin Mod" do
    @pet.save!
    sign_out @user
    @another_user = User.create!(email: "aaa@test.com", password: "ssssss")
    sign_in(@another_user)
    @user_details = @another_user.create_user_detail(name: "aaa")
    
    assert_raise Pundit::NotAuthorizedError do
      patch pet_url(@pet), params: { pet: { description: @pet.description, 
      location_id: @pet.location_id, name: @pet.name, pet_category_id: @pet.pet_category_id } }
    end
  end

end
