require "test_helper"

class NpkLevelDataControllerTest < ActionDispatch::IntegrationTest
  test "should get NPK_level_data_page" do
    get npk_level_data_NPK_level_data_page_url
    assert_response :success
  end
end
