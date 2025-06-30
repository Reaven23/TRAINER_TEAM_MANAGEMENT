require "test_helper"

class PlayerAssessmentsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get player_assessments_create_url
    assert_response :success
  end

  test "should get update" do
    get player_assessments_update_url
    assert_response :success
  end
end
