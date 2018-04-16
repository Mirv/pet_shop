require 'test_helper'
require 'app_owner_helper' # located in app/policy

class AppOwnerPolicyTest < ActiveSupport::TestCase

  include AppOwnerHelper
  include Pundit

  # def setup
  #   @name_obj = AppOwnerHelper::NameLogic.new("A Huge User")
  # end
  
  test "object initializes given name" do
    @name_obj = AppOwnerHelper::NameLogic.new("A Huge User", 0)
    refute @name_obj.nil?
  end

  test "raises error if nil" do
    assert_raise NameIsNil do
      @name_obj = AppOwnerHelper::NameLogic.new()
    end
    
    
  end




  # test "owner can edit" do
  #   policy = AppOwnerPolicy.new(@policy_dummy.user, @policy_dummy.pet)
  #   assert_equal true, policy.owner_check?
  # end

  # test "admin can edit other owners records" do
  #   @policy_dummy.provision_admin
  #   policy = AppOwnerPolicy.new(@policy_dummy.user, @policy_dummy.pet)
  #   assert_equal true, policy.admin?, "Admin, not owner failed."
  #   assert_equal true, policy.edit?, "Edit by admin failed"
  # end

  # test "only owner admin can hide location" do
  #   @policy_dummy.provision_admin("Cheeser Admin Soup")
  #   policy = AppOwnerPolicy.new(@policy_dummy.user, @policy_dummy.location)
  #   assert_equal true, policy.admin?, "is an Admin check failed"
  #   assert_equal true, policy.edit?
  # end

  # test "normal user fails edit" do
  #   @policy_dummy.provision_user
  #   policy = AppOwnerPolicy.new(@policy_dummy.user, @policy_dummy.location)
    
  #   assert_raise Pundit::NotAuthorizedError do
  #     policy.edit?
  #   end
  # end
  
  # # Load List of ... whatever
  # # check none have visible: true
  # test "only admin can see when published is set to false" do
  #   categories = policy_scope(Pet)
  #   @policy_dummy.user.update(published: false)
  #   invisible = @policy_dummy.user
  #   refute_includes categories, categories.includes?(invisible)
  # end
  
  # test "location is not a menu option when active is set to false" do
  # end
  
end