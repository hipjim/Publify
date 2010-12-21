require 'spec_helper'

describe "ads/edit.html.erb" do
  before(:each) do
    @ad = assign(:ad, stub_model(Ad,
      :title => "MyString",
      :body => "MyString",
      :price => "9.99"
    ))
  end

  it "renders the edit ad form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => ad_path(@ad), :method => "post" do
      assert_select "input#ad_title", :name => "ad[title]"
      assert_select "input#ad_body", :name => "ad[body]"
      assert_select "input#ad_price", :name => "ad[price]"
    end
  end
end
