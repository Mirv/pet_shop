require 'test_helper'
require 'app_owner_helper' # located in app/policy

# class LocationsControllerTest < ActionDispatch::IntegrationTest
# class AppOwnerPolicyTest  # < ActionDispatch::IntegrationTest
class AppOwnerPolicyTest < ActiveSupport::TestCase
  # include Devise::Test::IntegrationHelpers
  # include MiniTest::Assertions
  include AppOwnerHelper
  include Pundit
  

  # no sign_in/out necessary
  def setup
    current_user = @set_user
    @user_details = @user_detail
  end
  
  test "only_owner_mod_admin_can_edit_pet_record" do
    setup
    set_location
    set_pet_category
    set_pet(current_user)
    assert 1,0, "Fux"
  end

  # test "only owner, admin can hide location" do
    
  # end
  
  # test "only owner, moderator, admin can toggle active" do
    
  # end

  # test "only moderator, admin can toggle visible" do
    
  # end
  
  # test "only admin can see when visibile is set to false" do
  # end
  
  # test "location is not a menu option when active is set to false" do
  # end
  
end