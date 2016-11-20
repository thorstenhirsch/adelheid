require 'test_helper'

class ArtefactFiltersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @artefact_filter = artefact_filters(:one)
  end

  test "should get index" do
    get artefact_filters_url
    assert_response :success
  end

  test "should get new" do
    get new_artefact_filter_url
    assert_response :success
  end

  test "should create artefact_filter" do
    assert_difference('ArtefactFilter.count') do
      post artefact_filters_url, params: { artefact_filter: { application_id: @artefact_filter.application_id, key: @artefact_filter.key, value: @artefact_filter.value } }
    end

    assert_redirected_to artefact_filter_url(ArtefactFilter.last)
  end

  test "should show artefact_filter" do
    get artefact_filter_url(@artefact_filter)
    assert_response :success
  end

  test "should get edit" do
    get edit_artefact_filter_url(@artefact_filter)
    assert_response :success
  end

  test "should update artefact_filter" do
    patch artefact_filter_url(@artefact_filter), params: { artefact_filter: { application_id: @artefact_filter.application_id, key: @artefact_filter.key, value: @artefact_filter.value } }
    assert_redirected_to artefact_filter_url(@artefact_filter)
  end

  test "should destroy artefact_filter" do
    assert_difference('ArtefactFilter.count', -1) do
      delete artefact_filter_url(@artefact_filter)
    end

    assert_redirected_to artefact_filters_url
  end
end
