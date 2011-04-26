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

  def show
    @location = Location.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # DELETE /locations/1
  # DELETE /locations/1.xml
  # no delete  - locations are never deleted
end
