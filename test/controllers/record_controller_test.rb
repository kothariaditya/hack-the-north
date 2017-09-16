require 'test_helper'

class RecordControllerTest < ActionDispatch::IntegrationTest
  test "should get read" do
    get record_read_url
    assert_response :success
  end

end
