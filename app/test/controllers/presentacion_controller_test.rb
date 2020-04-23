# frozen_string_literal: true

require 'test_helper'

class PresentacionControllerTest < ActionDispatch::IntegrationTest
  test 'should get informacion' do
    get presentacion_informacion_url
    assert_response :success
  end
end
