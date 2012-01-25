class Image < ActiveRecord::Base
  has_attached_file :thumbnail
  has_attached_file :large
end
