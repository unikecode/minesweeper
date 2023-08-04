class BoardsController < ApplicationController
  def new
    @board = Board.new
  end

  def create
    @board = Board.new(board_params)
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
    params.require(:board).permit(:email, :width, :height, :mines_count, :name)
  end
end
