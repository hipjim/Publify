require 'spec_helper'

describe Location do
  before(:each) do
      @attr = { :location_name      => "Piata Romanilor",
		:location_type      => "street",
                :postcode      	    => "300100",
                :location_parent_id => 1,
		:longitude          => 21.22327,
		:latitude 	    => 45.753422
	      }
  end

  it "should create a new location given valid attributes" do
    Location.create!(@attr)
  end

  describe "location name validations" do
    it "should require a location name" do
      no_name_loc = Location.new(@attr.merge(:location_name => ""))
      no_name_loc.should_not be_valid
    end

    it "should reject longer location names" do
      long = "a" * 81
      hash = @attr.merge(:location_name => long)
      Location.new(hash).should_not be_valid
    end
  end

  describe "location type validations" do
    it "should reject other location types" do
      no_type_loc = Location.new(@attr.merge(:location_type => "big city"))
      no_type_loc.should_not be_valid
    end
  end

  describe "postcode validations" do
    it "should accept empty postcode for non-leaf nodes" do
      no_postcode_location = Location.new(@attr.merge(:postcode => nil, :location_type => 'county'))
      no_postcode_location.should be_valid
    end

    it "should not accept empty postcode for leaf nodes" do
      no_postcode_location = Location.new(@attr.merge(:postcode => nil))
      no_postcode_location.should_not be_valid
    end

    it "should accept valid postcodes" do
      postcodes = %w[300105 300003 300102]
      postcodes.each do |postcode|
        valid_postcode_location = Location.new(@attr.merge(:postcode => postcode))
        valid_postcode_location.should be_valid
      end
    end

    it "should reject invalid postcodes" do
      postcodes = %w[300abx a30567 056987]
      postcodes.each do |postcode|
        invalid_postcode_location = Location.new(@attr.merge(:postcode => postcode))
        invalid_postcode_location.should_not be_valid
      end
    end

    it "should reject different length postcodes" do
      short = "0" * 5
      hash = @attr.merge(:postcode => short)
      Location.new(hash).should_not be_valid
    end 
  end

  describe "longitude validations" do
    it "should not accept negative values" do
      negative = -1.0
      hash = @attr.merge(:longitude => negative)
      Location.new(hash).should_not be_valid
    end 
  end

  describe "latitude validations" do
    it "should not accept negative values" do
      negative = -1.0
      hash = @attr.merge(:latitude => negative)
      Location.new(hash).should_not be_valid
    end 
  end
end
