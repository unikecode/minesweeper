class AddCellsToBoards < ActiveRecord::Migration[5.0]
  def change
    add_column :boards, :cells, :text
  end
end
