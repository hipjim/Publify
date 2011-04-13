# == Schema Information
# Schema version: 20110208194509
#
# Table name: pair_tags
#
#  id          :integer(4)      not null, primary key
#  supertag_id :integer(4)      not null
#  subtag_id   :integer(4)      not null
#  created_at  :datetime
#  updated_at  :datetime
#

#a tag cannot be neither its own super-tag nor its own sub-tag
class PairValidator < ActiveModel::Validator
  def validate(record)
    if record.supertag_id == record.subtag_id
      record.errors[:base] = "Invalid Pair: super tag and sub tag cannot be similar."
    end
  end
end


class PairTag < ActiveRecord::Base
	include ActiveModel::Validations
        validates_with PairValidator


	#each tag may contain several sub-tags and may stem from several super-tags
 	belongs_to :supertag, :foreign_key => 'supertag_id', :class_name => 'Tag'
	belongs_to :subtag,   :foreign_key => 'subtag_id',   :class_name => 'Tag'

end


