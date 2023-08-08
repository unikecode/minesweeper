require 'test_helper'

class BoardsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get boards_url
    assert_response :success
  end

  test "should get new" do
    get new_board_url
    assert_response :success
  end

  test "should create board" do
    assert_difference('Board.count') do
      post boards_url, params: { board: { email: 'test@example.com', name: 'Test Board', width: 8, height: 8, mines_count: 10 } }
    end

    assert_redirected_to board_url(Board.last)
  end

  test "should not create invalid board" do
    assert_no_difference('Board.count') do
      post boards_url, params: { board: { email: 'invalid_email', name: '', width: 8, height: 8, mines_count: 10 } }
    end
  end
end
