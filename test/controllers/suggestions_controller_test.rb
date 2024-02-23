require "test_helper"

class SuggestionsControllerTest < ActionDispatch::IntegrationTest
  test "should get suggestions_page" do
    get suggestions_suggestions_page_url
    assert_response :success
  end
end
