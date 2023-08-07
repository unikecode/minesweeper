require 'test_helper'

class BoardTest < ActiveSupport::TestCase
  test "should be valid with valid attributes" do
    board = Board.new(
      email: 'test@example.com',
      name: 'Test Board',
      width: 10,
      height: 10,
      mines_count: 20,
      cells: [0, 1, 0, 1, 0, 1]
    )
    assert board.valid?
  end

  test "should not be valid without an email" do
    board = Board.new(
      name: 'Test Board',
      width: 10,
      height: 10,
      mines_count: 20,
      cells: [0, 1, 0, 1, 0, 1]
    )
    assert_not board.valid?
  end

  test "should have a unique email" do
    Board.create(
      email: 'test@example.com',
      name: 'Test Board',
      width: 10,
      height: 10,
      mines_count: 20,
      cells: [0, 1, 0, 1, 0, 1]
    )
    board = Board.new(
      email: 'test@example.com',
      name: 'Another Board',
      width: 8,
      height: 8,
      mines_count: 15,
      cells: [1, 0, 1, 0, 1, 0]
    )
    assert_not board.valid?
  end

  test "should not be valid without a name" do
    board = Board.new(
      email: 'test@example.com',
      width: 10,
      height: 10,
      mines_count: 20,
      cells: [0, 1, 0, 1, 0, 1]
    )
    assert_not board.valid?
  end

  test "should be valid with a name of maximum length" do
    board = Board.new(
      email: 'test@example.com',
      name: 'x' * 100,
      width: 10,
      height: 10,
      mines_count: 20,
      cells: [0, 1, 0, 1, 0, 1]
    )
    assert board.valid?
  end

  test "should not be valid with a name exceeding maximum length" do
    board = Board.new(
      email: 'test@example.com',
      name: 'x' * 101,
      width: 10,
      height: 10,
      mines_count: 20,
      cells: [0, 1, 0, 1, 0, 1]
    )
    assert_not board.valid?
  end

  test "should serialize and deserialize cells array" do
    cells_array = [0, 1, 0, 1, 0, 1]
    board = Board.new(
      email: 'test@example.com',
      name: 'Test Board',
      width: 10,
      height: 10,
      mines_count: 20,
      cells: cells_array
    )
    board.save
    reloaded_board = Board.find(board.id)
    assert_equal cells_array, reloaded_board.cells
  end

  test "should search boards by name" do
    board1 = Board.create(
      email: 'test1@example.com',
      name: 'Rails Board',
      width: 8,
      height: 8,
      mines_count: 10,
      cells: [1, 0, 1, 0, 1, 0]
    )
    board2 = Board.create(
      email: 'test2@example.com',
      name: 'React Board',
      width: 8,
      height: 8,
      mines_count: 15,
      cells: [0, 1, 0, 1, 0, 1]
    )

    search_result = Board.search_by_name('Rails')

    assert_includes search_result, board1
    assert_not_includes search_result, board2
  end
end
