class CreateLocations < ActiveRecord::Migration
  def self.up
    create_table :locations do |t|
      t.string :location_name, :null => false
      t.string :location_type, :null => false
      t.integer :location_parent_id, :null => false
      t.string :postcode
      t.decimal :latitude, :default => 0
      t.decimal :longitude, :default => 0

      t.timestamps
    end

    add_index :locations, :location_name, :unique => true
    add_index :locations, :postcode
  end
  

  def self.down
    drop_table :locations
  end
end
