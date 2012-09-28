require 'test_helper'

class AccountControllerTest < ActionController::TestCase
  test "should get signin" do
    get :signin
    assert_response :success
  end

  test "should get signup" do
    get :signup
    assert_response :success
  end

  test "should get logout" do
    get :logout
    assert_response :success
  end

  test "should get setting" do
    get :setting
    assert_response :success
  end

end
