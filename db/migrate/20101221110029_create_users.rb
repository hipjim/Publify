class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :email, :null => false, :unique => true

      t.timestamps
    end

    execute "ALTER TABLE `users` ADD UNIQUE `unique_user_email` (`email`)"
  end

  def self.down
    drop_table :users
  end
end
