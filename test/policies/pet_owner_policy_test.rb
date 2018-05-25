require 'test_helper'
require 'app_owner_helper' # located in app/policy

class AppOwnerPolicyTest < ActiveSupport::TestCase

  include AppOwnerHelper
  include Pundit

  def setup
    app_class = AppOwnerHelper::PolicyDummy
    app_class.purge_table(Pet)
    @policy_dummy = app_class.new("A user")
    @policy = AppOwnerPolicy.new(@policy_dummy.user, @policy_dummy.pet)
  end
  
  test "new pet is draft" do
    assert_equal @policy_dummy.pet.pet_status, "draft" #, "5000 would mean draft"
  end
  
  test "owner can edit" do
    assert_equal true, @policy.owner_check?
  end
  
  test "normal user fails edit" do
    @policy_dummy.provision_user
    @policy = AppOwnerPolicy.new(@policy_dummy.user, @policy_dummy.pet)
    
    assert_raise Pundit::NotAuthorizedError do
      @policy.edit?
    end
  end
  
  # Users shouldn't be able to remove records, only change their visibility
  test "destroy always fails" do
    refute @policy.destroy?
  end
  
  

end