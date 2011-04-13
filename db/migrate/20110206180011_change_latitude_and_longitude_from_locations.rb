class ChangeLatitudeAndLongitudeFromLocations < ActiveRecord::Migration
  def self.up
	change_table :locations do |t|
  		t.remove :latitude, :longitude
  		t.decimal :latitude, :longitude, :precision => 12, :scale => 9, :default => 0.0
	end
  end

  def self.down
	change_table :locations do |t|
  		t.remove :latitude, :longitude
  		t.decimal :latitude, :longitude, :default => 0.0
	end
  end
end
