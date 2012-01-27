class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.string :name
      t.integer :position

      t.timestamps
    end
    
    change_table :images do |t|
      t.remove :section
      t.references :section
    end
  end
end
