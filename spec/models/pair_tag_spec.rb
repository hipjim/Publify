require 'spec_helper'

describe PairTag do
  before(:each) do
      @attr = { :supertag_id => 1,
                :subtag_id   => 2,
	      }
  end

  it "should create a new pair tag given valid attributes" do
    PairTag.create!(@attr)
  end

  it "should require a valid pair tag" do
      notvalid_ptag = PairTag.new(@attr.merge(:subtag_id => 1))
      notvalid_ptag.should_not be_valid
    end
end
