require 'test_helper'

class PetsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  
  setup do
    @user = users(:one)
    sign_in(@user)
    @user_details = @user.create_user_detail(name: "Adam")
    
    @location = Location.find_by(name: "MyString")
    @pet_category = PetCategory.create(name: "Animal")
    
    @pet = @user_details.pets.create!(name: "Test", pet_category: @pet_category,
    location: @location, published: true, visible: true, available: true)
  end

  test "should get index" do
    get pets_url
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

  test "should show pet" do
    get pet_url(@pet)
    assert_response :success
  end

  test "should get edit" do
    get edit_pet_url(@pet)
    assert_response :success
  end
  
  test "should not get edit if not Owner Admin Mod" do
    sign_out @user
    patch pet_url(@pet), params: { pet: { description: @pet.description, 
    location_id: @pet.location_id, name: @pet.name, pet_category_id: @pet.pet_category_id } }
    assert_redirected_to root_url, "Failed to block access to editing"
  end

  test "should update pet" do
    patch pet_url(@pet), params: { pet: { description: @pet.description, 
    location_id: @pet.location_id, name: @pet.name, pet_category_id: @pet.pet_category_id } }
    assert_redirected_to pet_url(@pet)
  end
  
  test "should not update if not Owner Admin Mod" do
    sign_out @user
    patch pet_url(@pet), params: { pet: { description: @pet.description, 
    location_id: @pet.location_id, name: @pet.name, pet_category_id: @pet.pet_category_id } }
    assert_redirected_to root_url, "Failed to block access to update when not owner/admin/mod"
  end

end
