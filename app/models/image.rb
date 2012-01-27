class Image < ActiveRecord::Base
  belongs_to :section
  has_attached_file :thumbnail
  has_attached_file :large
  validates :name, :presence => true
  validates :position, :presence => true, :inclusion => { :in => 0..100 }
end
