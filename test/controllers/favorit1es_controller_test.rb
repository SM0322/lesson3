require "test_helper"

class Favorit1esControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get favorit1es_create_url
    assert_response :success
  end

  test "should get destroy" do
    get favorit1es_destroy_url
    assert_response :success
  end
end
