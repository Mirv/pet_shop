require 'test_helper'

class PetCategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pet_category = pet_categories(:one)
  end

  test "should get index" do
    get pet_categories_url
    assert_response :success
  end

  test "should get new" do
    get new_pet_category_url
    assert_response :success
  end

  test "should create pet_category" do
    assert_difference('PetCategory.count') do
      post pet_categories_url, params: { pet_category: { description: @pet_category.description, name: @pet_category.name } }
    end

    assert_redirected_to pet_category_url(PetCategory.last)
  end

  test "should show pet_category" do
    get pet_category_url(@pet_category)
    assert_response :success
  end

  test "should get edit" do
    get edit_pet_category_url(@pet_category)
    assert_response :success
  end

  test "should update pet_category" do
    patch pet_category_url(@pet_category), params: { pet_category: { description: @pet_category.description, name: @pet_category.name } }
    assert_redirected_to pet_category_url(@pet_category)
  end
end
