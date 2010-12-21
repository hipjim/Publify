class Ad < ActiveRecord::Base

  validates :title, :presence => true,
                    :length => {:within => 3..255}

  validates :body, :presence => true,
                   :length => {:within => 3..2000}

  validates :price, :presence => true,
                    :numericality => true

  has_and_belongs_to_many :tags

end
