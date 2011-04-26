require 'spec_helper'

describe "locations/show.html.erb" do
  before(:each) do
    @location = assign(:location, stub_model(Location,
      :location_name => "Location Name",
      :location_type => "Location Type",
      :location_parent_id => 1,
      :postcode => "Postcode",
      :latitude => "9.990000000",
      :longitude => "9.990000000"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Location Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Location Type/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Postcode/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/9.990000000/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/9.990000000/)
  end
end
