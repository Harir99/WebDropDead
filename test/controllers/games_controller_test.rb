require "test_helper"

class GamesControllerTest < ActionDispatch::IntegrationTest
  test "should get play" do
    get games_play_url
    assert_response :success
  end

  test "should get run" do
    get games_run_url
    assert_response :success
  end
end
