require 'test_helper'

class SourceVcsRepositoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @source_vcs_repository = source_vcs_repositories(:one)
  end

  test "should get index" do
    get source_vcs_repositories_url
    assert_response :success
  end

  test "should get new" do
    get new_source_vcs_repository_url
    assert_response :success
  end

  test "should create source_vcs_repository" do
    assert_difference('SourceVcsRepository.count') do
      post source_vcs_repositories_url, params: { source_vcs_repository: { name: @source_vcs_repository.name, server_id: @source_vcs_repository.server_id, shortname: @source_vcs_repository.shortname } }
    end

    assert_redirected_to source_vcs_repository_url(SourceVcsRepository.last)
  end

  test "should show source_vcs_repository" do
    get source_vcs_repository_url(@source_vcs_repository)
    assert_response :success
  end

  test "should get edit" do
    get edit_source_vcs_repository_url(@source_vcs_repository)
    assert_response :success
  end

  test "should update source_vcs_repository" do
    patch source_vcs_repository_url(@source_vcs_repository), params: { source_vcs_repository: { name: @source_vcs_repository.name, server_id: @source_vcs_repository.server_id, shortname: @source_vcs_repository.shortname } }
    assert_redirected_to source_vcs_repository_url(@source_vcs_repository)
  end

  test "should destroy source_vcs_repository" do
    assert_difference('SourceVcsRepository.count', -1) do
      delete source_vcs_repository_url(@source_vcs_repository)
    end

    assert_redirected_to source_vcs_repositories_url
  end
end
