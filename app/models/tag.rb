# == Schema Information
# Schema version: 20110208194509
#
# Table name: tags
#
#  id              :integer(4)      not null, primary key
#  tag_name        :string(255)     not null
#  no_of_supertags :integer(4)      default(0)
#  no_of_subtags   :integer(4)      default(0)
#  created_at      :datetime
#  updated_at      :datetime
#

class Tag < ActiveRecord::Base

	attr_accessible :tag_name

  	validates :tag_name, :presence => true, :uniqueness => {:case_sensitive => false}

	#a tag may be associated to many ads
	has_many :taggings, :dependent => :destroy
  	has_many :ads, 	    :through => :taggings

	#a tag contains many sub_tags and may stems from many super_tags
    has_many :supertags_of_pair,  :foreign_key => 'supertag_id', :class_name => 'PairTag'
  	has_many :subtags_of_pair,    :foreign_key => 'subtag_id',   :class_name => 'PairTag'
  	has_many :supertags,  	      :through => :supertags_of_pair, :dependent => :destroy
  	has_many :subtags,    	      :through => :subtags_of_pair,   :dependent => :destroy
	
	#custom validator  - to avoid "circles" in the hierachy
end
