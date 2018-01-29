require 'test_helper'

class ResetPasswordControllerTest < ActionDispatch::IntegrationTest
  test "should get search" do
    get reset_password_search_url
    assert_response :success
  end

end
