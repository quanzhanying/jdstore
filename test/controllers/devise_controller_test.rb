require 'test_helper'

class DeviseControllerTest < ActionDispatch::IntegrationTest
  test "should get users" do
    get devise_users_url
    assert_response :success
  end

end
