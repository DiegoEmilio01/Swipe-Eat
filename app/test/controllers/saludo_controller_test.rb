# frozen_string_literal: true

require 'test_helper'

class SaludoControllerTest < ActionDispatch::IntegrationTest
  test 'should get hello' do
    get saludo_hello_url
    assert_response :success
  end
end
