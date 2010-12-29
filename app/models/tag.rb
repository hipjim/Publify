class Tag < ActiveRecord::Base

  attr_accessible :name

  validates :name, :presence => true,
            :uniqueness => {:case_sensitive => false}

  has_many :taggings, :dependent => :destroy
  has_many :ads, :through => :taggings


  def self.find_or_create(tag_names)
    transaction do
      found_tags = where("name in (?)", tag_names).all
      new_tags = (tag_names - found_tags.collect(&:name)).collect { |item| create!(:name => item) }
      found_tags + new_tags
    end
  end

  def ==(other)
  
  end

end
