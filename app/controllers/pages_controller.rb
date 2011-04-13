class PagesController < ApplicationController
  def home
	@title = "Anunturi Publice"
  end

  def new
	@title = "Introducere Anunt Nou"
  end

  def blog
	@title = "Stiri si Noutati"
  end

  def team
	@title = "Echipa"
  end

  def contact
	@title = "Contact"
  end

end
