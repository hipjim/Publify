class CreatePairTags < ActiveRecord::Migration
  def self.up
    create_table :pair_tags do |t|
      t.integer :supertag_id, :null => false
      t.integer :subtag_id,   :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :pair_tags
  end
end
