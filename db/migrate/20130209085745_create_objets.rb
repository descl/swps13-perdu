class CreateObjets < ActiveRecord::Migration
  def change
    create_table :objets do |t|
      t.string :name
      t.string :category

      t.timestamps
    end
  end
end
