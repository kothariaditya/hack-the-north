require 'test_helper'

class RecordsControllerTest < ActionDispatch::IntegrationTest
  test "should get read" do
    get records_read_url
    assert_response :success
  end

end
