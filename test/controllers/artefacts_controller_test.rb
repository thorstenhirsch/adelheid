require 'test_helper'

class ArtefactsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @artefact = artefacts(:one)
  end

  test "should get index" do
    get artefacts_url
    assert_response :success
  end

  test "should get new" do
    get new_artefact_url
    assert_response :success
  end

  test "should create artefact" do
    assert_difference('Artefact.count') do
      post artefacts_url, params: { artefact: { description: @artefact.description, name: @artefact.name } }
    end

    assert_redirected_to artefact_url(Artefact.last)
  end

  test "should show artefact" do
    get artefact_url(@artefact)
    assert_response :success
  end

  test "should get edit" do
    get edit_artefact_url(@artefact)
    assert_response :success
  end

  test "should update artefact" do
    patch artefact_url(@artefact), params: { artefact: { description: @artefact.description, name: @artefact.name } }
    assert_redirected_to artefact_url(@artefact)
  end

  test "should destroy artefact" do
    assert_difference('Artefact.count', -1) do
      delete artefact_url(@artefact)
    end

    assert_redirected_to artefacts_url
  end
end
