require 'spec_helper'

describe "locations/edit.html.erb" do
  before(:each) do
    @location = assign(:location, stub_model(Location,
      :location_name => "MyString",
      :location_type => "MyString",
      :location_parent_id => 1,
      :postcode => "MyString",
      :latitude => "9.99",
      :longitude => "9.99"
    ))
  end

  it "renders the edit location form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => location_path(@location), :method => "post" do
      assert_select "input#location_location_name", :name => "location[location_name]"
      assert_select "input#location_location_type", :name => "location[location_type]"
      assert_select "input#location_location_parent_id", :name => "location[location_parent_id]"
      assert_select "input#location_postcode", :name => "location[postcode]"
      assert_select "input#location_latitude", :name => "location[latitude]"
      assert_select "input#location_longitude", :name => "location[longitude]"
    end
  end
end
