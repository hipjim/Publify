require 'spec_helper'

describe AdsController do

  def mock_ad(stubs={})
    (@mock_ad ||= mock_model(Ad).as_null_object).tap do |ad|
      ad.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all ads as @ads" do
      Ad.stub(:all) { [mock_ad] }
      get :index
      assigns(:ads).should eq([mock_ad])
    end
  end

  describe "GET show" do
    it "assigns the requested ad as @ad" do
      Ad.stub(:find).with("37") { mock_ad }
      get :show, :id => "37"
      assigns(:ad).should be(mock_ad)
    end
  end

  describe "GET new" do
    it "assigns a new ad as @ad" do
      Ad.stub(:new) { mock_ad }
      get :new
      assigns(:ad).should be(mock_ad)
    end
  end

  describe "GET edit" do
    it "assigns the requested ad as @ad" do
      Ad.stub(:find).with("37") { mock_ad }
      get :edit, :id => "37"
      assigns(:ad).should be(mock_ad)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created ad as @ad" do
        Ad.stub(:new).with({'these' => 'params'}) { mock_ad(:save => true) }
        post :create, :ad => {'these' => 'params'}
        assigns(:ad).should be(mock_ad)
      end

      it "redirects to the created ad" do
        Ad.stub(:new) { mock_ad(:save => true) }
        post :create, :ad => {}
        response.should redirect_to(ad_url(mock_ad))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved ad as @ad" do
        Ad.stub(:new).with({'these' => 'params'}) { mock_ad(:save => false) }
        post :create, :ad => {'these' => 'params'}
        assigns(:ad).should be(mock_ad)
      end

      it "re-renders the 'new' template" do
        Ad.stub(:new) { mock_ad(:save => false) }
        post :create, :ad => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested ad" do
        Ad.should_receive(:find).with("37") { mock_ad }
        mock_ad.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :ad => {'these' => 'params'}
      end

      it "assigns the requested ad as @ad" do
        Ad.stub(:find) { mock_ad(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:ad).should be(mock_ad)
      end

      it "redirects to the ad" do
        Ad.stub(:find) { mock_ad(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(ad_url(mock_ad))
      end
    end

    describe "with invalid params" do
      it "assigns the ad as @ad" do
        Ad.stub(:find) { mock_ad(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:ad).should be(mock_ad)
      end

      it "re-renders the 'edit' template" do
        Ad.stub(:find) { mock_ad(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested ad" do
      Ad.should_receive(:find).with("37") { mock_ad }
      mock_ad.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the ads list" do
      Ad.stub(:find) { mock_ad }
      delete :destroy, :id => "1"
      response.should redirect_to(ads_url)
    end
  end

end
