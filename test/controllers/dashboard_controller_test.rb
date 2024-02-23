require "test_helper"

class DashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get dashboard_page" do
    get dashboard_dashboard_page_url
    assert_response :success
  end
end
