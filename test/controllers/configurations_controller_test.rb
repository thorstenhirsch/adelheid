require 'test_helper'

class ConfigurationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @configuration = configurations(:one)
  end

  test "should get index" do
    get configurations_url
    assert_response :success
  end

  test "should get new" do
    get new_configuration_url
    assert_response :success
  end

  test "should create configuration" do
    assert_difference('Configuration.count') do
      post configurations_url, params: { configuration: { authentication_type: @configuration.authentication_type, create_artifacts_on_the_fly: @configuration.create_artifacts_on_the_fly, http_password_digest: @configuration.http_password_digest, http_user: @configuration.http_user, use_authentication: @configuration.use_authentication } }
    end

    assert_redirected_to configuration_url(Configuration.last)
  end

  test "should show configuration" do
    get configuration_url(@configuration)
    assert_response :success
  end

  test "should get edit" do
    get edit_configuration_url(@configuration)
    assert_response :success
  end

  test "should update configuration" do
    patch configuration_url(@configuration), params: { configuration: { authentication_type: @configuration.authentication_type, create_artifacts_on_the_fly: @configuration.create_artifacts_on_the_fly, http_password_digest: @configuration.http_password_digest, http_user: @configuration.http_user, use_authentication: @configuration.use_authentication } }
    assert_redirected_to configuration_url(@configuration)
  end

  test "should destroy configuration" do
    assert_difference('Configuration.count', -1) do
      delete configuration_url(@configuration)
    end

    assert_redirected_to configurations_url
  end
end
