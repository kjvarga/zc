class Image < ActiveRecord::Base
  belongs_to :section
  has_attached_file :thumbnail
  has_attached_file :large
  validates :title, :presence => true
  validates :section, :presence => true
  validates :position, :presence => true, :inclusion => { :in => 1..100 }
  validate :must_have_images
  
  def must_have_images
    errors.add(:thumbnail, "image is missing") if @thumbnail.blank?
    errors.add(:large, "image is missing") if @large.blank?
  end
end
