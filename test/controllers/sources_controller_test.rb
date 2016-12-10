require 'test_helper'

class SourcesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @source = sources(:one)
  end

  test "should get index" do
    get sources_url
    assert_response :success
  end

  test "should get new" do
    get new_source_url
    assert_response :success
  end

  test "should create source" do
    assert_difference('Source.count') do
      post sources_url, params: { source: { artifact_id: @source.artifact_id, type: @source.type } }
    end

    assert_redirected_to source_url(Source.last)
  end

  test "should show source" do
    get source_url(@source)
    assert_response :success
  end

  test "should get edit" do
    get edit_source_url(@source)
    assert_response :success
  end

  test "should update source" do
    patch source_url(@source), params: { source: { artifact_id: @source.artifact_id, type: @source.type } }
    assert_redirected_to source_url(@source)
  end

  test "should destroy source" do
    assert_difference('Source.count', -1) do
      delete source_url(@source)
    end

    assert_redirected_to sources_url
  end
end
