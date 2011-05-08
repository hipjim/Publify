class LocationsController < ApplicationController

  def index
    @title = "Manipulare Locatii"
	#use act_as_tree to show the locations

	if !signed_in? 
		flash.new[:errors] = "You are not signed in!"
		redirect_to root_path
    end

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  #inserts after the current <li> tag a <ul> tag containing all the children
  #of the current location
  def expand
    @expandloc = Location.find_by_id(params[:id].split('_')[1])
	
	respond_to do |format|
      format.js #expand.js.erb
    end
  end

  #removes the <ul> tag containing the children
  def contract
	respond_to do |format|
      format.js #contract.js.erb
    end
  end

  def show
    @location = Location.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end
end
