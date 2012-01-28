class Image < ActiveRecord::Base
  belongs_to :section
  has_attached_file :thumbnail
  has_attached_file :large
  validates :title, :presence => true
  validates :section, :presence => true
  validates :position, :presence => true, :inclusion => { :in => 1..100 }
  validates_attachment_presence :thumbnail
  validates_attachment_presence :large
end
