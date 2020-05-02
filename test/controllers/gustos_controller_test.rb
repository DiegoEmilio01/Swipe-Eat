require 'test_helper'

class GustosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get gustos_index_url
    assert_response :success
  end

  test "should get show" do
    get gustos_show_url
    assert_response :success
  end

  test "should get new" do
    get gustos_new_url
    assert_response :success
  end

  test "should get edit" do
    get gustos_edit_url
    assert_response :success
  end

end
