class AddAttachmentImageToTiles < ActiveRecord::Migration
  def self.up
    change_table :tiles do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :tiles, :image
  end
end
