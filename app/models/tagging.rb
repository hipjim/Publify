class Tagging < ActiveRecord::Base

  belongs_to :ad
  belongs_to :tag

end
