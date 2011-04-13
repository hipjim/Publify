class RenameAdTypeToAds < ActiveRecord::Migration
  def self.up
	change_table :ads do |ad|
  		ad.rename :type, :ad_type
	end
  end

  def self.down
	change_table :ads do |ad|
  		ad.rename :ad_type, :type
	end
  end
end
