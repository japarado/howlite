require 'test_helper'

class HrsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hr = hrs(:one)
  end

  test "should get index" do
    get hrs_url
    assert_response :success
  end

  test "should get new" do
    get new_hr_url
    assert_response :success
  end

  test "should create hr" do
    assert_difference('Hr.count') do
      post hrs_url, params: { hr: {  } }
    end

    assert_redirected_to hr_url(Hr.last)
  end

  test "should show hr" do
    get hr_url(@hr)
    assert_response :success
  end

  test "should get edit" do
    get edit_hr_url(@hr)
    assert_response :success
  end

  test "should update hr" do
    patch hr_url(@hr), params: { hr: {  } }
    assert_redirected_to hr_url(@hr)
  end

  test "should destroy hr" do
    assert_difference('Hr.count', -1) do
      delete hr_url(@hr)
    end

    assert_redirected_to hrs_url
  end
end
