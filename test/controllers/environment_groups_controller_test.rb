require 'test_helper'

class EnvironmentGroupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @environment_group = environment_groups(:one)
  end

  test "should get index" do
    get environment_groups_url
    assert_response :success
  end

  test "should get new" do
    get new_environment_group_url
    assert_response :success
  end

  test "should create environment_group" do
    assert_difference('EnvironmentGroup.count') do
      post environment_groups_url, params: { environment_group: { name: @environment_group.name } }
    end

    assert_redirected_to environment_group_url(EnvironmentGroup.last)
  end

  test "should show environment_group" do
    get environment_group_url(@environment_group)
    assert_response :success
  end

  test "should get edit" do
    get edit_environment_group_url(@environment_group)
    assert_response :success
  end

  test "should update environment_group" do
    patch environment_group_url(@environment_group), params: { environment_group: { name: @environment_group.name } }
    assert_redirected_to environment_group_url(@environment_group)
  end

  test "should destroy environment_group" do
    assert_difference('EnvironmentGroup.count', -1) do
      delete environment_group_url(@environment_group)
    end

    assert_redirected_to environment_groups_url
  end
end
