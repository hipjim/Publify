# == Schema Information
# Schema version: 20110208194509
#
# Table name: locations
#
#  id                 :integer(4)      not null, primary key
#  location_name      :string(255)     not null
#  location_type      :string(255)     not null
#  location_parent_id :integer(4)      not null
#  postcode           :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  latitude           :decimal(12, 9)  default(0.0)
#  longitude          :decimal(12, 9)  default(0.0)
#

#a "leaf" type location must have a not null postcode column
class PostcodeValidator < ActiveModel::Validator
  def validate(record)
    if (record.location_type == 'street' or record.location_type == 'village') and record.postcode.nil?
      record.errors[:base] = "Invalid Location: Street and Village locations must have a valid postcode."
    end
  end
end


class Location < ActiveRecord::Base

	include ActiveModel::Validations
        validates_with PostcodeValidator

	#associations
	#------------
	#each Location may contain several sub-Locations
        acts_as_tree :foreign_key => 'location_parent_id', :order => "postcode" 

	#each Location contains several Users
	has_many :users

	#each Location contains several Ads
	has_many :ads

	#validations
	#-----------
	#name & type
	validates :location_name, :presence => true, :length => { :maximum => 80 }
	validates :location_type, :presence => true, :inclusion => { :in => %w(city county village street country postcode) }
	#postcode is not unique because the are locations (i.e. Timisoara) with no postcode, and
        #there are several locations (i.e. street sections) with similar postcode. In the latter case we 
        #we generate a record for each location allowing some redundancy into the table because there are 
	#not many such cases.

	validates :postcode, :length => { :is => 6 },
			     :format => { :with => /\A[1-9][0-9]+\z/, :on => :create },
			     :allow_nil => true
			     
	#gps coordinates
	validates :latitude,  :numericality => { :greater_than_or_equal_to => 0.0, 
						 :on => :create,
						 :message => "Latitude is a decimal value." }
	validates :longitude, :numericality => { :greater_than_or_equal_to => 0.0, 
						 :on => :create,
						 :message => "Longitude is a decimal value." }

	#checks if a string is a postcode        
	def self.isPostcode (location)
		!location.nil? && location.size == 6 && location =~ /\A[1-9][0-9]+\z/
        end

        #extracts a list of all subLocations 
	def subLocations
	end
end
