require 'test_helper'
require 'app_owner_helper' # located in app/policy

class PetsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  include Pundit
  include AppOwnerHelper

  setup do
    @policy_dummy = AppOwnerHelper::PolicyDummy.new("PrimaryUser")
    sign_in @policy_dummy.user
  end

  test "should get index" do
    get pets_url
    assert_response :success
  end

  test "should show pet" do
    pet = @policy_dummy.pet
    get pet_url(pet)
    assert_response :success
  end

  test "should get new" do
    get new_pet_url
    assert_response :success
  end

  test "should create pet" do
    @pet = @policy_dummy.pet
    assert_difference('Pet.count') do
      post pets_url, params: { pet: { description: @pet.description, 
      location_id: @pet.location_id, name: @pet.name, pet_category_id: @pet.pet_category_id } }
    end
    assert_redirected_to pet_url(Pet.last)
  end
  
  test "should get edit" do
    pet = @policy_dummy.pet
    get edit_pet_url(pet)
    assert_response :success
  end

  test "should update pet" do
    @pet = @policy_dummy.pet
    patch pet_url(@pet), params: { pet: { description: @pet.description, 
    location_id: @pet.location_id, name: @pet.name, pet_category_id: @pet.pet_category_id } }
    assert_redirected_to pet_url(@pet)
  end
  
  test "should not get edit if not Owner Admin" do
    pet = @policy_dummy.pet
    sign_out @policy_dummy.user
    @admin_dummy = AppOwnerHelper::PolicyDummy.new("Second User")
    sign_in @admin_dummy.user
  
    assert_raise Pundit::NotAuthorizedError do
      get edit_pet_url(pet)
    end
  end
  
  test "should not update if not Owner Admin Mod" do
    @pet = @policy_dummy.pet
    sign_out @policy_dummy.user
    @admin_dummy = AppOwnerHelper::PolicyDummy.new("SecondUser")
    sign_in @admin_dummy.user

    assert_raise Pundit::NotAuthorizedError do
      patch pet_url(@pet), params: { pet: { description: @pet.description, 
      location_id: @pet.location_id, name: @pet.name, pet_category_id: @pet.pet_category_id } }
    end
  end

end
