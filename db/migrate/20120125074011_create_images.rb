class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :title
      t.text :description
      t.integer :position
      t.string :section

      t.timestamps
    end
    add_index :images, :position
  end
end
