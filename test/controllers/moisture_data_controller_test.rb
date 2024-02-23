require "test_helper"

class MoistureDataControllerTest < ActionDispatch::IntegrationTest
  test "should get moisture_data_page" do
    get moisture_data_moisture_data_page_url
    assert_response :success
  end
end
