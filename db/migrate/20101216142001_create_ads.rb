class CreateAds < ActiveRecord::Migration
  def self.up
    create_table :ads do |t|
      t.string :title, :null => false
      t.text :body, :null => false
      t.string :ip, :null => false
      t.decimal :price, :precision => 8, :scale => 2, :null => false, :default => 0
      t.integer :user_id, :null => false
      t.integer :location_id, :null => false
      t.integer :hits, :null=> false, :default => 0
      t.boolean :status, :null=> false, :default => true

      t.timestamps
    end
  end

  def self.down
    drop_table :ads
  end
end
