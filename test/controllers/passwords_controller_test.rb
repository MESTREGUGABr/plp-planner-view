require "test_helper"

class PasswordsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get passwords_new_url
    assert_response :success
  end

  test "should get edit" do
    get passwords_edit_url
    assert_response :success
  end
end
