require 'test_helper'

class ComentariosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get comentarios_index_url
    assert_response :success
  end

  test "should get show" do
    get comentarios_show_url
    assert_response :success
  end

  test "should get new" do
    get comentarios_new_url
    assert_response :success
  end

  test "should get edit" do
    get comentarios_edit_url
    assert_response :success
  end

end
