require 'test_helper'

class SourceVcsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @source_vc = source_vcs(:one)
  end

  test "should get index" do
    get source_vcs_url
    assert_response :success
  end

  test "should get new" do
    get new_source_vc_url
    assert_response :success
  end

  test "should create source_vc" do
    assert_difference('SourceVc.count') do
      post source_vcs_url, params: { source_vc: { branch: @source_vc.branch, repository_id: @source_vc.repository_id, revision: @source_vc.revision, tag: @source_vc.tag } }
    end

    assert_redirected_to source_vc_url(SourceVc.last)
  end

  test "should show source_vc" do
    get source_vc_url(@source_vc)
    assert_response :success
  end

  test "should get edit" do
    get edit_source_vc_url(@source_vc)
    assert_response :success
  end

  test "should update source_vc" do
    patch source_vc_url(@source_vc), params: { source_vc: { branch: @source_vc.branch, repository_id: @source_vc.repository_id, revision: @source_vc.revision, tag: @source_vc.tag } }
    assert_redirected_to source_vc_url(@source_vc)
  end

  test "should destroy source_vc" do
    assert_difference('SourceVc.count', -1) do
      delete source_vc_url(@source_vc)
    end

    assert_redirected_to source_vcs_url
  end
end
