class AddPictureColumnsToObjets < ActiveRecord::Migration
  def self.up
    add_attachment :objets, :picture
  end

  def self.down
    remove_attachment :objets, :picture
  end
end