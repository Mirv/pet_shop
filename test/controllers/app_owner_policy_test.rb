require 'test_helper'
require 'app_owner_helper' # located in app/policy

# class LocationsControllerTest < ActionDispatch::IntegrationTest
# class AppOwnerPolicyTest  # < ActionDispatch::IntegrationTest
class AppOwnerPolicyTest < ActiveSupport::TestCase
  # include Devise::Test::IntegrationHelpers
  # include MiniTest::Assertions
  include AppOwnerHelper
  include Pundit
  

  # # no sign_in/out necessary
  # def setup
  #   @current_user = @set_user
  #   @user_details = @user_detail
  # end
  
  def setup
    @policy_dummy = AppOwnerHelper::PolicyDummy.new
    @user = @policy_dummy.set_user
    @policy_dummy.set_location
    # @user_details = AppOwnerHelper::PolicyDummy.set_user_detail
  end
  
  test "owner can edit" do
    @pet = @policy_dummy.set_pet
    @policy = AppOwnerPolicy.new(@user, @pet)
    assert_equal true, @policy.owner_check?
  end

  test "mod can edit other owners reocrds" do
    @pet = @policy_dummy.set_pet
    @user = @policy_dummy.make_user
    @policy = AppOwnerPolicy.new(@user, @pet)
    byebug
    assert_equal true, @policy.owner_check?
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