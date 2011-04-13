# == Schema Information
# Schema version: 20110206151022
#
# Table name: ads
#
#  id          :integer(4)      not null, primary key
#  title       :string(255)     not null
#  body        :text            default(""), not null
#  ad_type     :string(255)     not null
#  ip          :string(255)
#  hits        :integer(4)
#  status      :string(255)     default("inactive")
#  price       :float           default(0.0)
#  user_id     :integer(4)
#  location_id :integer(4)
#  created_at  :datetime
#  updated_at  :datetime
#

class Ad < ActiveRecord::Base

	#fields
	attr_accessor :location_name, :tag_list
	attr_accessible :title, :body, :price, :location_name, :tag_list

    #associations
	#An Ad belongs to a location and to a user, and has many tags (categories)
 	#When a new Ad is introduced either a new user is sign-up or an existent user is sing-in
    belongs_to :location, :readonly => true
	belongs_to :user, :readonly => true

    has_many :taggings, :dependent => :destroy
  	has_many :tags, :through => :taggings

	#validations
    validates :title, :presence => true, :length => {:within => 10..100}

    validates :body, :presence => true, :length => {:within => 10..2000}

	validates :price, :presence => true, :numericality => { :greater_than_or_equal_to => 0.0, 
					       			:on => :create,
					       			:message => "Price is strictly a positive value." }
	validates :tag_list, :presence => true

	before_create :clearup, :set_type
	before_save   :extract_location, :save_ip
	after_save    :extract_tags

	def location
		Location.find_by_id(location_id)
	end

	def taglist
		#TBD - actual format
		taglist = String.new("")
		self.tags.each do |tag|
			if taglist == ""
				taglist << tag.tag_name
				next
			end
			taglist << ", " << tag.tag_name
		end
		return taglist
	end

   private
		def to_name
			@title
		end

      	def extract_location
			return if location_name.nil?
			if Location.isPostcode(location_name) 
				#Need to show selection div for user to select a location from the list
                #Replace search with find_Location.all_by_postcode(location_name)
				if !Location.find_by_postcode(location_name).nil?
                	self.location = Location.find_by_postcode(location_name)
				end
			else
				if !Location.find_by_location_name(location_name).nil?			
 					self.location = Location.find_by_location_name(location_name)
				end
			end
     	end

 		def extract_tags
			#creates the tag 
      		tag_array = eliminate_duplicated_tags(@tag_list).split(/\s+/)
			
			#classify the ad for each tag 
			tag_array.each do |t|
				tag = Tag.find_by_tag_name(t)
				if !tag.nil?
					classified = Tagging.create(:ad_id => self.id, :tag_id => tag.id)
				else
					#non-existent tag - proposal should be generated
				end
			end
		end

		def eliminate_duplicated_tags (tag_list)
			#tbd
			tag_list
		end

		def clearup
			#eliminates white spaces from names - other verifications
		end

		def set_type
			self.ad_type = "offer"
		end

		def save_ip
			self.ip = request.remote_ip
		end
end
