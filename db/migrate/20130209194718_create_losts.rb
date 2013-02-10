class CreateLosts < ActiveRecord::Migration
  def change
    create_table :losts do |t|
      t.string :name
      t.string :category
      t.string :contact
      t.string :description

      t.timestamps
    end
  end
end
