require 'test_helper'

class AdminControllerTest < ActionDispatch::IntegrationTest
  test "should get destroy" do
    get admin_destroy_url
    assert_response :success
  end

end
