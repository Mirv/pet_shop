require 'test_helper'

class LocationsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @user = users(:one)
    sign_in(@user)
    @location = @user.user_detail.locations.create!(name: "User 1's place")
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

  test "should not get edit if not Owner Admin Mod" do
    puts "--- #{@user.id} ---"
    sign_out @user
    @user.user_detail.locations.create!(name: "#{@user.user_detail.name}", user_detail_id: @user)
    puts "- weird syntex #{@user.user_detail.locations.first.name}"
    @user = users(:two)
    puts "--- new user: #{@user.id} ---"
    sign_in @user
    puts "- #{@location.name} -"
    patch location_url(@location), params: { location: {name: "someplace" }}
    assert_redirected_to root_url, "Failed to block access to editing"
  end


  test "should update location" do
    patch location_url(@location), params: { 
      location: { name: @location.name, xcoordinate: @location.xcoordinate, 
      ycoordinate: @location.ycoordinate } }
    assert_redirected_to location_url(@location)
  end
  

end
