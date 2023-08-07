class BoardsController < ApplicationController
  def index
    @boards = Board.order(created_at: :desc)
  end

  def new
    @board = Board.new
    @recent_boards = Board.order(created_at: :desc).limit(10)
  end

  def create
    @board = Board.new(email: board_params[:email], name: board_params[:name])
    @board.cells = MinesweeperBoard.generate_board(board_params[:width].to_i, board_params[:height].to_i, board_params[:mines_count].to_i)

    if @board.save
      redirect_to board_path(@board)
    else
      render :new
    end
  end

  def show
    @board = Board.find_by_id(params[:id])
  end

  private

  def board_params
    params.require(:board).permit(:name, :email, :width, :height, :mines_count).transform_keys(&:to_sym)
  end
end
