require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post users_url, params: { user: { confirmation_sent_at: @user.confirmation_sent_at, confirmation_token: @user.confirmation_token, confirmed_at: @user.confirmed_at, email: @user.email, encrypted_password: @user.encrypted_password, failed_attempts: @user.failed_attempts, firstname: @user.firstname, lastname: @user.lastname, locked_at: @user.locked_at, reset_password_sent_at: @user.reset_password_sent_at, reset_password_token: @user.reset_password_token, role: @user.role, unlock_token: @user.unlock_token, username: @user.username } }
    end

    assert_redirected_to user_url(User.last)
  end

  test "should show user" do
    get user_url(@user)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_url(@user)
    assert_response :success
  end

  test "should update user" do
    patch user_url(@user), params: { user: { confirmation_sent_at: @user.confirmation_sent_at, confirmation_token: @user.confirmation_token, confirmed_at: @user.confirmed_at, email: @user.email, encrypted_password: @user.encrypted_password, failed_attempts: @user.failed_attempts, firstname: @user.firstname, lastname: @user.lastname, locked_at: @user.locked_at, reset_password_sent_at: @user.reset_password_sent_at, reset_password_token: @user.reset_password_token, role: @user.role, unlock_token: @user.unlock_token, username: @user.username } }
    assert_redirected_to user_url(@user)
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete user_url(@user)
    end

    assert_redirected_to users_url
  end
end
