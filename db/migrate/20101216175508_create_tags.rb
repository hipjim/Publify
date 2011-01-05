class CreateTags < ActiveRecord::Migration
  def self.up
    create_table :tags do |t|
      t.string :name, :null => false

      t.timestamps
    end

    #execute "ALTER TABLE `tags` ADD UNIQUE `unique_tag_name` (`name`)"
  end

  def self.down
    drop_table :tags
  end
end
