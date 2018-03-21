require 'test_helper'

class LocationsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  include Pundit
  setup do
    @user = User.create!(email: "atta@test.com", password: "ssssss")
    @details = @user.create_user_detail(name: "atta")
    @location = @details.locations.create!(name: "User 1's place")
    sign_in(@user)
  end
  
  test "should get index" do
    get locations_url
    assert_response :success
  end

  test "should get new" do
    get new_location_url
    assert_response :success
  end

  test "should create location" do
    assert_difference('Location.count') do
      post locations_url, params: { 
        location: { name: @location.name, xcoordinate: @location.xcoordinate, 
        ycoordinate: @location.ycoordinate} }
    end
    assert_redirected_to location_url(Location.last)
  end

  test "should show location" do
    get location_url(@location)
    assert_response :success
  end
  
  test "should get edit" do
    get edit_location_url(@location)
    assert_response :success
  end
  
  test "should not get edit if not owner" do
    sign_out(@user)
    @not_owner = User.create!(email: "blah@test.com", password: "ssssss")
    @details = @not_owner.create_user_detail!(name: "blahta")
    sign_in @not_owner
    
    assert_raise Pundit::NotAuthorizedError do
      get edit_location_url(@location)
    end
  end


end
