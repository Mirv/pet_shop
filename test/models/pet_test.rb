require 'test_helper'
require 'app_owner_helper' # located in app/policy


class PetTest < ActiveSupport::TestCase
  include AppOwnerHelper

  def setup 
    @dummy = AppOwnerHelper::PolicyDummy.new("A user")
  end
  
  # Test all of the pet enums
  # ... this are actually just is the model working tests, not policy tests
  
  test "owner can draft" do
    assert @dummy.pet.draft!
  end
  
  test "owner can publish" do
    assert @dummy.pet.published!
  end

  test "owner can cancel" do
    assert @dummy.pet.cancelled!
  end

  test "owner can sell" do
    assert @dummy.pet.sold!
  end
end
