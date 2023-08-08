class CreateBoards < ActiveRecord::Migration[5.0]
  def change
    create_table :boards do |t|
      t.string :email, null: false, unique: true
      t.integer :width, null: false
      t.integer :height, null: false
      t.integer :mines_count, null: false
      t.string :name, null: false, default: '', limit: 100

      t.timestamps
    end
  end
end
