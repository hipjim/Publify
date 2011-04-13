class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :name, :null => false
      t.string :email, :null => false
      t.string :telephone
      t.string :encrypted_password, :null => false
      t.string :salt, :null => false
      t.boolean :admin, :default => false
      t.integer :location_id

      t.timestamps
    end

    add_index :users, :email, :unique => true
    add_index :users, :name
    add_index :users, :telephone
  end

  def self.down
    drop_table :users
  end
end
