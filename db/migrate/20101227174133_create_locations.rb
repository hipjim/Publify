class CreateLocations < ActiveRecord::Migration
  def self.up
    create_table :locations do |t|
      t.string :city
      t.decimal :lat, :precision => 18, :scale => 12, :null => false
      t.decimal :lon, :precision => 18, :scale => 12, :null => false
    end
  end

  def self.down
    drop_table :locations
  end
end
