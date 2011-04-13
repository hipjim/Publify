class CreateTags < ActiveRecord::Migration
  def self.up
    create_table :tags do |t|
      t.string :tag_name, 	  :null => false
      t.integer :no_of_supertags, :default => 0
      t.integer :no_of_subtags,   :default => 0

      t.timestamps
    end
  end

  def self.down
    drop_table :tags
  end
end
