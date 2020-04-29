require 'test_helper'

class CrudsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get cruds_index_url
    assert_response :success
  end

end
