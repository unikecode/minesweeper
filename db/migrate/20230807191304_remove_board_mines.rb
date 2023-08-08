class RemoveBoardMines < ActiveRecord::Migration[5.0]
  def change
    remove_column :boards, :mines_count
  end
end
