class BoardsController < ApplicationController
  before_action :validate_mines, only: :create

  def index
    @boards = params[:search] ? Board.search_by_name(params[:search]) : Board.order(created_at: :desc)
    page_number = params[:page].to_i.positive? ? params[:page] : 1
    @boards = @boards.page(page_number).per(5)
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
    params.require(:board).permit(:name, :email, :width, :height, :mines_count)
  end

  def validate_mines
    if board_params[:mines_count].to_i > board_params[:height].to_i * board_params[:width].to_i
      flash[:alert] = 'Number of Mines can not be greater than the size of board.'
      redirect_back(fallback_location: root_path)
    end
  end 
end
