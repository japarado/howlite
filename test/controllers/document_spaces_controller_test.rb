require 'test_helper'

class DocumentSpacesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @document_space = document_spaces(:one)
  end

  test "should get index" do
    get document_spaces_url
    assert_response :success
  end

  test "should get new" do
    get new_document_space_url
    assert_response :success
  end

  test "should create document_space" do
    assert_difference('DocumentSpace.count') do
      post document_spaces_url, params: { document_space: {  } }
    end

    assert_redirected_to document_space_url(DocumentSpace.last)
  end

  test "should show document_space" do
    get document_space_url(@document_space)
    assert_response :success
  end

  test "should get edit" do
    get edit_document_space_url(@document_space)
    assert_response :success
  end

  test "should update document_space" do
    patch document_space_url(@document_space), params: { document_space: {  } }
    assert_redirected_to document_space_url(@document_space)
  end

  test "should destroy document_space" do
    assert_difference('DocumentSpace.count', -1) do
      delete document_space_url(@document_space)
    end

    assert_redirected_to document_spaces_url
  end
end
