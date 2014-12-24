class AddUserIdToTiles < ActiveRecord::Migration
  def change
    add_column :tiles, :user_id, :integer
    add_index :tiles, :user_id
  end
end
