require 'test_helper'

class LocationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @location = locations(:one)
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

  test "should update location" do
    patch location_url(@location), params: { 
      location: { name: @location.name, xcoordinate: @location.xcoordinate, 
      ycoordinate: @location.ycoordinate } }
    assert_redirected_to location_url(@location)
  end
  
  test "only owner / admin can hide location" do
    
  end
  
  test "only owner / moderator / admin can toggle active" do
    
  end

  test "only moderator / admin can toggle visible" do
    
  end
  
  test "only admin can see when visibile is set to false" do
  end
  
  test "location is not a menu option when active is set to false" do
  end
end
