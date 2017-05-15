require 'test_helper'

class FavoriteListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @favorite_list = favorite_lists(:one)
  end

  test "should get index" do
    get favorite_lists_url
    assert_response :success
  end

  test "should get new" do
    get new_favorite_list_url
    assert_response :success
  end

  test "should create favorite_list" do
    assert_difference('FavoriteList.count') do
      post favorite_lists_url, params: { favorite_list: { product_id: @favorite_list.product_id, user_id: @favorite_list.user_id } }
    end

    assert_redirected_to favorite_list_url(FavoriteList.last)
  end

  test "should show favorite_list" do
    get favorite_list_url(@favorite_list)
    assert_response :success
  end

  test "should get edit" do
    get edit_favorite_list_url(@favorite_list)
    assert_response :success
  end

  test "should update favorite_list" do
    patch favorite_list_url(@favorite_list), params: { favorite_list: { product_id: @favorite_list.product_id, user_id: @favorite_list.user_id } }
    assert_redirected_to favorite_list_url(@favorite_list)
  end

  test "should destroy favorite_list" do
    assert_difference('FavoriteList.count', -1) do
      delete favorite_list_url(@favorite_list)
    end

    assert_redirected_to favorite_lists_url
  end
end
