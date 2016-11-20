require 'test_helper'

class UserApplicationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_application = user_applications(:one)
  end

  test "should get index" do
    get user_applications_url
    assert_response :success
  end

  test "should get new" do
    get new_user_application_url
    assert_response :success
  end

  test "should create user_application" do
    assert_difference('UserApplication.count') do
      post user_applications_url, params: { user_application: { application_id: @user_application.application_id, environment_spec: @user_application.environment_spec, user_id: @user_application.user_id } }
    end

    assert_redirected_to user_application_url(UserApplication.last)
  end

  test "should show user_application" do
    get user_application_url(@user_application)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_application_url(@user_application)
    assert_response :success
  end

  test "should update user_application" do
    patch user_application_url(@user_application), params: { user_application: { application_id: @user_application.application_id, environment_spec: @user_application.environment_spec, user_id: @user_application.user_id } }
    assert_redirected_to user_application_url(@user_application)
  end

  test "should destroy user_application" do
    assert_difference('UserApplication.count', -1) do
      delete user_application_url(@user_application)
    end

    assert_redirected_to user_applications_url
  end
end
