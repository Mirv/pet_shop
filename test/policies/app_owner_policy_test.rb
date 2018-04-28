require 'test_helper'
require 'app_owner_helper' # located in app/policy

class AppOwnerPolicyTest < ActiveSupport::TestCase

  include AppOwnerHelper
  include Pundit

  def setup
    purge_table(Pet)
    @policy_dummy = AppOwnerHelper::PolicyDummy.new("A user")
  end
  
  def purge_table(instance_of)
    Array(instance_of).each do |x|
      x.name.constantize.all.delete_all
    end
  end

  test "owner can edit" do
    policy = AppOwnerPolicy.new(@policy_dummy.user, @policy_dummy.pet)
    assert_equal true, policy.owner_check?
  end

  test "admin can edit other owners records" do
    @policy_dummy.provision_admin
    policy = AppOwnerPolicy.new(@policy_dummy.user, @policy_dummy.pet)
    assert_equal true, policy.admin?, "Admin, not owner failed."
    assert_equal true, policy.edit?, "Edit by admin failed"
  end

  test "only owner admin can hide location" do
    @policy_dummy.provision_admin("Cheeser Admin Soup")
    policy = AppOwnerPolicy.new(@policy_dummy.user, @policy_dummy.location)
    assert_equal true, policy.admin?, "is an Admin check failed"
    assert_equal true, policy.edit?
  end

  test "normal user fails edit" do
    @policy_dummy.provision_user
    policy = AppOwnerPolicy.new(@policy_dummy.user, @policy_dummy.location)
    
    assert_raise Pundit::NotAuthorizedError do
      policy.edit?
    end
  end
 
  test "only ownerAdmin can see when published is set to false" do
    @policy_dummy.pet.update(published: false)
    invisible = @policy_dummy.pet
    @policy_dummy.provision_user
    pets = PolicyDummy::Scope.new(@policy_dummy.user, Pet).scope #.all
    refute Array(pets).include?(invisible)
  end
  
  test "location is not a menu option when active is set to false" do
    @policy_dummy.location.update(active: true)
    locations = PolicyDummy::Scope.new(@policy_dummy.user, Location).scope 
    refute Array(locations).include?(@policy_dummy.location)
  end
  
end