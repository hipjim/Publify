# == Schema Information
# Schema version: 20110208195705
#
# Table name: taggings
#
#  id         :integer(4)      not null, primary key
#  tag_id     :integer(4)      not null
#  ad_id      :integer(4)      not null
#  created_at :datetime
#  updated_at :datetime
#

class Tagging < ActiveRecord::Base
	#a tagging uniquely associates a tag to a certain ad	
	belongs_to :ad
  	belongs_to :tag
end
