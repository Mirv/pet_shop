require 'test_helper'
require 'app_owner_helper' # located in app/policy

class AppOwnerPolicyTest < ActiveSupport::TestCase

  include AppOwnerHelper

  test "object initializes normally" do
    @name_obj = AppOwnerHelper::NameLogic.new("Huge User")
    refute @name_obj.nil?
    assert_match "huge_user", @name_obj.target_name
  end

  # test "raises error if nil" do
  #   assert_raise NameIsNil do
  #     @name_obj = AppOwnerHelper::NameLogic.new(nil)
  #   end
  # end

  test "raises error if blank" do
    assert_raise NameIsBlank do
      @name_obj = AppOwnerHelper::NameLogic.new(" ")
    end
  end
end