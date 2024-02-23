require "test_helper"

class PhLevelDataControllerTest < ActionDispatch::IntegrationTest
  test "should get ph_level_data_page" do
    get ph_level_data_ph_level_data_page_url
    assert_response :success
  end
end
