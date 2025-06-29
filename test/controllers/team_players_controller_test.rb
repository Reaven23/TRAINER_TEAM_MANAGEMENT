require "test_helper"

class TeamPlayersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get team_players_new_url
    assert_response :success
  end

  test "should get create" do
    get team_players_create_url
    assert_response :success
  end

  test "should get destroy" do
    get team_players_destroy_url
    assert_response :success
  end
end
