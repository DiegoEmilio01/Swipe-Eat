require 'test_helper'

class ComunasControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get comunas_new_url
    assert_response :success
  end

  test "should get index" do
    get comunas_index_url
    assert_response :success
  end

  test "should get show" do
    get comunas_show_url
    assert_response :success
  end

  test "should get edit" do
    get comunas_edit_url
    assert_response :success
  end

end
