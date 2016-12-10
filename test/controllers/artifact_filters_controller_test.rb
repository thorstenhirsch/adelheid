require 'test_helper'

class ArtifactFiltersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @artifact_filter = artifact_filters(:one)
  end

  test "should get index" do
    get artifact_filters_url
    assert_response :success
  end

  test "should get new" do
    get new_artifact_filter_url
    assert_response :success
  end

  test "should create artifact_filter" do
    assert_difference('ArtifactFilter.count') do
      post artifact_filters_url, params: { artifact_filter: { application_id: @artifact_filter.application_id, key: @artifact_filter.key, value: @artifact_filter.value } }
    end

    assert_redirected_to artifact_filter_url(ArtifactFilter.last)
  end

  test "should show artifact_filter" do
    get artifact_filter_url(@artifact_filter)
    assert_response :success
  end

  test "should get edit" do
    get edit_artifact_filter_url(@artifact_filter)
    assert_response :success
  end

  test "should update artifact_filter" do
    patch artifact_filter_url(@artifact_filter), params: { artifact_filter: { application_id: @artifact_filter.application_id, key: @artifact_filter.key, value: @artifact_filter.value } }
    assert_redirected_to artifact_filter_url(@artifact_filter)
  end

  test "should destroy artifact_filter" do
    assert_difference('ArtifactFilter.count', -1) do
      delete artifact_filter_url(@artifact_filter)
    end

    assert_redirected_to artifact_filters_url
  end
end
