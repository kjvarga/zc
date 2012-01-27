class Section < ActiveRecord::Base
  has_many :images, :order => 'position ASC, id ASC', :dependent => :nullify
  default_scope :order => 'position ASC, id ASC'
  default_value_for :position do
    Section.count + 1
  end
  validates :name, :presence => true
  validates :position, :presence => true, :inclusion => { :in => 0..100 }
end
