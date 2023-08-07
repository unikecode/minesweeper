class RemoveBoardWidthAndHeight < ActiveRecord::Migration[5.0]
  def change
    remove_column :boards, :width
    remove_column :boards, :height
  end
end
