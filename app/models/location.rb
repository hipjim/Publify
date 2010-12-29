class Location < ActiveRecord::Base

  has_many :ads

  validates :name, :presence => true

end
