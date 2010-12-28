class Tag < ActiveRecord::Base

  attr_accessible :name

  validates :name, :presence => true,
            :uniqueness => {:case_sensitive => false}

  has_many :taggings, :dependent => :destroy
  has_many :ads, :through => :taggings


end
