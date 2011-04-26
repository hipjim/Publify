require 'spec_helper'

describe "locations/new.html.erb" do
  before(:each) do
    assign(:location, stub_model(Location,
      :location_name => "MyString",
      :location_type => "MyString",
      :location_parent_id => 1,
      :postcode => "MyString",
      :latitude => "9.99",
      :longitude => "9.99"
    ).as_new_record)
  end

  it "renders new location form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => locations_path, :method => "post" do
      assert_select "input#location_location_name", :name => "location[location_name]"
      assert_select "input#location_location_type", :name => "location[location_type]"
      assert_select "input#location_location_parent_id", :name => "location[location_parent_id]"
      assert_select "input#location_postcode", :name => "location[postcode]"
      assert_select "input#location_latitude", :name => "location[latitude]"
      assert_select "input#location_longitude", :name => "location[longitude]"
    end
  end
end
