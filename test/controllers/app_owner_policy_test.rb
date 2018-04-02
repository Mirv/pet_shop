require 'test_helper'
require 'app_owner_helper' # located in app/policy

class AppOwnerPolicyTest < ActiveSupport::TestCase

  include AppOwnerHelper
  include Pundit

  # # no sign_in/out necessary
  # # List of tests, 
  # => affirm owner, admin can both edit, hide, deactivate
  # => affirm admin can delete
  # => affirm links dont show when not permitted

  def setup
    @policy_dummy = AppOwnerHelper::PolicyDummy.new("A user")
  end

  test "admin can edit other owners records" do
    policy_admin = AppOwnerHelper::PolicyDummy.new("Admin")
    policy_admin.user_details.update(admin: true)
    policy = AppOwnerPolicy.new(policy_admin.user, @policy_dummy.pet)
    assert_equal true, policy.admin?
    assert_equal true, policy.userAdmin?
  end
  
  test "owner can edit" do
    policy = AppOwnerPolicy.new(@policy_dummy.user, @policy_dummy.pet)
    assert_equal true, policy.owner_check?
    assert_equal true, policy.userAdmin?
  end
  
  test "only owner, admin can hide location" do
    user = @policy_dummy.make_user
    @policy_dummy.user_details.update(admin: true)
    policy = AppOwnerPolicy.new(@policy_dummy.user, @policy_dummy.pet)
    assert_equal true, policy.admin?
  end
  
  # test "only owner, admin can toggle active" do
    
  # end

  # test "only admin can toggle visible" do
    
  # end
  
  # test "only admin can see when visibile is set to false" do
  # end
  
  # test "location is not a menu option when active is set to false" do
  # end
  
end