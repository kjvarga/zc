class ModifyImages < ActiveRecord::Migration
  def up
    change_table :images do |t|
      t.has_attached_file :thumbnail
      t.has_attached_file :large
    end
  end

  def down
    drop_attached_file :images, :thumbnail
    drop_attached_file :images, :large
  end
end
