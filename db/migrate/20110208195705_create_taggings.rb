class CreateTaggings < ActiveRecord::Migration
  def self.up
    create_table :taggings do |t|
      t.integer :tag_id, :null => false
      t.integer :ad_id,  :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :taggings
  end
end
