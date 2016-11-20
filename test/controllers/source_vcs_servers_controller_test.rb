require 'test_helper'

class SourceVcsServersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @source_vcs_server = source_vcs_servers(:one)
  end

  test "should get index" do
    get source_vcs_servers_url
    assert_response :success
  end

  test "should get new" do
    get new_source_vcs_server_url
    assert_response :success
  end

  test "should create source_vcs_server" do
    assert_difference('SourceVcsServer.count') do
      post source_vcs_servers_url, params: { source_vcs_server: { name: @source_vcs_server.name, password: @source_vcs_server.password, url: @source_vcs_server.url, user: @source_vcs_server.user, vcs: @source_vcs_server.vcs } }
    end

    assert_redirected_to source_vcs_server_url(SourceVcsServer.last)
  end

  test "should show source_vcs_server" do
    get source_vcs_server_url(@source_vcs_server)
    assert_response :success
  end

  test "should get edit" do
    get edit_source_vcs_server_url(@source_vcs_server)
    assert_response :success
  end

  test "should update source_vcs_server" do
    patch source_vcs_server_url(@source_vcs_server), params: { source_vcs_server: { name: @source_vcs_server.name, password: @source_vcs_server.password, url: @source_vcs_server.url, user: @source_vcs_server.user, vcs: @source_vcs_server.vcs } }
    assert_redirected_to source_vcs_server_url(@source_vcs_server)
  end

  test "should destroy source_vcs_server" do
    assert_difference('SourceVcsServer.count', -1) do
      delete source_vcs_server_url(@source_vcs_server)
    end

    assert_redirected_to source_vcs_servers_url
  end
end
