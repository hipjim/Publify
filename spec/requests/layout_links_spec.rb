require 'spec_helper'

describe "LayoutLinks" do

  it "should have a Home page at '/'" do
    get '/'
    response.should have_selector('title', :content => "Publify - Anunturi Publice")
  end

  it "should have a Contact page at '/contact'" do
    get '/contact'
    response.should have_selector('title', :content => "Publify - Contact")
  end

  it "should have an New page at '/new'" do
    get '/new'
    response.should have_selector('title', :content => "Publify - Introducere Anunt Nou")
  end

  it "should have a Blog page at '/blog'" do
    get '/blog'
    response.should have_selector('title', :content => "Publify - Stiri si Noutati")
  end

  it "should have an Team page at '/team'" do
    get '/team'
    response.should have_selector('title', :content => "Publify - Echipa")
  end

  it "should have a Login page at '/login'" do
    get '/login'
    response.should have_selector('title', :content => "Publify - Intrare Utilizatori")
  end

  describe "when not signed in" do
    it "should have a signin link" do
      visit root_path
      response.should have_selector("a", :href => login_path,
                                         :content => "Login")
    end
  end

  describe "when signed in" do

    before(:each) do
      @user = Factory(:user)
      visit login_path
      fill_in :email,    :with => @user.email
      fill_in :password, :with => @user.password
      click_button
    end

    it "should have a signout link" do
      visit root_path
      response.should have_selector("a", :href => logout_path,
                                         :content => "Logout")
    end 
  end

end
