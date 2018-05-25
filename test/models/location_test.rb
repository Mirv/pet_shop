require 'test_helper'
require 'app_owner_helper' # located in app/policy

class LocationTest < ActiveSupport::TestCase
  include AppOwnerHelper

  def setup 
    @dummy = AppOwnerHelper::PolicyDummy.new("A user")
  end
  
  # Test all of the location enums

  test "owner can close" do
    assert @dummy.location.closed!
  end
  
  test "owner can open" do
    assert @dummy.location.open! 
  end

  test "owner can out_of_business" do
    assert @dummy.location.out_of_business!
  end

end