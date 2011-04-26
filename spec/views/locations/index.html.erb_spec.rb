require 'spec_helper'

describe "locations/index.html.erb" do
  before(:each) do
    assign(:locations, [
      stub_model(Location,
        :location_name => "Location Name",
        :location_type => "Location Type",
        :location_parent_id => 1,
        :postcode => "Postcode",
        :latitude => "9.99",
        :longitude => "9.99"
      ),
      stub_model(Location,
        :location_name => "Location Name",
        :location_type => "Location Type",
        :location_parent_id => 1,
        :postcode => "Postcode",
        :latitude => "9.99",
        :longitude => "9.99"
      )
    ])
  end

  it "renders a list of locations" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Location Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Location Type".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Postcode".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
