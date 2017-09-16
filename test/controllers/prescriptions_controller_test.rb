require 'test_helper'

class PrescriptionsControllerTest < ActionDispatch::IntegrationTest
  test "should get read" do
    get prescriptions_read_url
    assert_response :success
  end

end
