class Ad < ActiveRecord::Base

  attr_accessible :title, :body, :price, :tag_names, :email_address, :location_name

  # associations
  has_many :taggings, :dependent => :destroy
  has_many :tags, :through => :taggings

  belongs_to :location
  belongs_to :user

  # title validations
  validates :title, :presence => true,
            :length => {:within => 3..255}

  # body validations
  validates :body, :presence => true,
            :length => {:within => 3..2000}

  # price validations
  validates :price, :presence => true,
            :numericality => true


  # virtual attribute for tags string, email address
  attr_writer :tag_names, :email_address, :location_name

  def from_ip(ip)
    self.ip = ip
  end

  def tag_names
    self.tags.map(&:name).join(' ')
  end

  def email_address
    self.user.email unless self.user.nil?
  end

  def location_name
    self.location.city unless self.location.nil?
  end

  # callbacks
  before_save :assign_users, :assign_tags, :assign_location

  private

  def assign_tags
    if @tag_names
      self.tags = @tag_names.split(/\s+/).map do |tag_name|
        Tag.find_or_create_by_name(tag_name)
      end
    end
  end

  def assign_users
    if @email_address
      self.user = User.find_or_create_by_email(@email_address)
    end
  end

  def assign_location
    if @location_name
      self.location = Location.find_by_city(@location_name)
    end
  end

end
