class AddIndexToSections < ActiveRecord::Migration
  def change
    add_index :sections, :position
  end
end
