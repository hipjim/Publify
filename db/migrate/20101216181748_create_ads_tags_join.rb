class CreateAdsTagsJoin < ActiveRecord::Migration
  def self.up
    create_table 'ads_tags', :id => false do |t|
      t.integer :ad_id, :null => false
      t.integer :tag_id, :null => false
    end
  end
end

def self.down
  drop_table 'ads_tags'
end