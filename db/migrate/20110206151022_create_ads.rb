class CreateAds < ActiveRecord::Migration
  def self.up
    create_table :ads do |t|
      t.string :title, :null => false
      t.text :body, :null => false
      t.string :type, :null => false
      t.string :ip
      t.integer :hits
      t.string :status, :default => 'inactive'
      t.float :price, :default => 0.0
      t.integer :user_id
      t.integer :location_id

      t.timestamps
    end

    add_index :ads, :title
    add_index :ads, :price
	
  end

  def self.down
    drop_table :ads
  end
end
