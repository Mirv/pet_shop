require 'test_helper'
require 'app_owner_helper' # located in app/policy

class AppOwnerPolicyTest < ActiveSupport::TestCase

  include AppOwnerHelper
  include Pundit

  def purge_table(instance_of)
    Array(instance_of).each do |x|
      x.name.constantize.all.delete_all
    end
  end
  
  def setup
    # purge_table(Pet)
    Array(Pet).each do |x|
      x.name.constantize.all.delete_all
    end
    @policy_dummy = AppOwnerHelper::PolicyDummy.new("A user")
  end

  # moving to pet_owner_policy_test.rb
  # test "owner can edit" do
  #   policy = AppOwnerPolicy.new(@policy_dummy.user, @policy_dummy.pet)
  #   assert_equal true, policy.owner_check?
  # end

  test "admin can edit other owners records" do
    @policy_dummy.provision_admin
    policy = AppOwnerPolicy.new(@policy_dummy.user, @policy_dummy.pet)
    assert_equal true, policy.admin?, "Admin, not owner failed."
    assert_equal true, policy.edit?, "Edit by admin failed"
  end

  # moving to location tests
  # test "only owner admin can hide location" do
  #   @policy_dummy.provision_admin("Cheeser Admin Soup")
  #   policy = AppOwnerPolicy.new(@policy_dummy.user, @policy_dummy.location)
  #   assert_equal true, policy.admin?, "is an Admin check failed"
  #   assert_equal true, policy.edit?, "the edit? check failed"
  # end

  # moving to pet_owner_policy_test.rb
  # test "normal user fails edit" do
  #   @policy_dummy.provision_user
  #   policy = AppOwnerPolicy.new(@policy_dummy.user, @policy_dummy.location)
    
  #   assert_raise Pundit::NotAuthorizedError do
  #     policy.edit?
  #   end
  # end

  test "when pet visible all can see" do
    @policy_dummy.pet.update(visible: true)
    pets = PolicyDummy::Scope.new(@policy_dummy.user, Pet).resolve
    assert_includes pets, @policy_dummy.pet
  end
  
  # this test is irrelevent as I need new allowed codes enum for policies
  test "when pet not visible nonOwnerAdmin do not see" do
    @policy_dummy.pet.update(visible: false)
    @policy_dummy3 = AppOwnerHelper::PolicyDummy.new("A new user")
    pets = PolicyDummy::Scope.new(@policy_dummy3.user, Pet).resolve
    refute_includes pets, @policy_dummy.pet
  end
  
  test "when location visible all can see" do
    @policy_dummy.location.update(active: true)
    @policy_dummy2 = AppOwnerHelper::PolicyDummy.new("A new user")
    location_list = PolicyDummy::Scope.new(@policy_dummy2, Location).resolve
    assert_includes location_list, @policy_dummy.location
  end

  test "when location not visible nonOwnerAdmin do not see" do
    @policy_dummy.location.update(visible: false)
    locations = PolicyDummy::Scope.new(@policy_dummy.user, Location).resolve 
    refute_includes locations, @policy_dummy.location
  end
end