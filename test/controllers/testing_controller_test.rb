require 'test_helper'

class TestingControllerTest < ActionDispatch::IntegrationTest
  test "should get test1" do
    get testing_test1_url
    assert_response :success
  end

end
