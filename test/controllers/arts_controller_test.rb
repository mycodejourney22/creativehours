require "test_helper"

class ArtsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get arts_show_url
    assert_response :success
  end
end
