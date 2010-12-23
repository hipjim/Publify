class Ad < ActiveRecord::Base

  # associations
  has_many :taggings, :dependent => :destroy
  has_many :tags, :through => :taggings

  # title validations
  validates :title, :presence => true,
            :length => {:within => 3..255}

  # body validations
  validates :body, :presence => true,
            :length => {:within => 3..2000}

  # price validations
  validates :price, :presence => true,
            :numericality => true

  belongs_to :user

  # virtual attribute for tags string
  attr_writer :tag_names

  def tag_names
    self.tags.map(&:name).join(' ')
  end

  # callbacks
  after_save :assign_tags

  private
  def assign_tags
    if @tag_names
      self.tags = @tag_names.split(/\s+/).map do |tag_name|
        Tag.find_or_create_by_name(tag_name)
      end
    end
  end

end
