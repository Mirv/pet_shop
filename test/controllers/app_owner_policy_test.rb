require 'test_helper'
require 'app_owner_helper' # located in app/policy

# class LocationsControllerTest < ActionDispatch::IntegrationTest
# class AppOwnerPolicyTest  # < ActionDispatch::IntegrationTest
class AppOwnerPolicyTest < ActiveSupport::TestCase

  include AppOwnerHelper
  include Pundit
  

  # # no sign_in/out necessary
  # def setup
  #   @current_user = @set_user
  #   @user_details = @user_detail
  # end
  
  def setup
    @policy_dummy = AppOwnerHelper::PolicyDummy.new
  end
  
  test "owner can edit" do
    @policy = AppOwnerPolicy.new(@policy_dummy.user, @policy_dummy.pet)
    assert_equal true, @policy.owner_check?
  end

  test "mod can edit other owners reocrds" do
    user = @policy_dummy.make_user
    user.user_detail.update(moderator: true)
    @policy_dummy.set_user_detail
    policy = AppOwnerPolicy.new(@policy_dummy.user, @policy_dummy.pet)
    assert_equal true, policy.moderator?
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