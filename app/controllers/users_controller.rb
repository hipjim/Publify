class UsersController < ApplicationController
  def new
	@title = "Furnizare adresa email"
	if signed_in?
		#modify view to take care of this
		redirect_to new_ad_path
 	else 
    	#if already there is a known user delete it, 
		#or forget last introduced email 
		if known_user?
			miss_known_user
		end
	end 
  end

  def show
	if !signed_in?
		redirect_to root_path
	end
    @title = "Profilul privat pentru #{currently_signedin_user.name}"
	@ads = currently_signedin_user.ads
  end

  def create
    #user creation deferred to ads controller 
    user = User.find_by_email(params[:user][:email])

    #save essential data to cookies to decide what fields to show in new ad form
    if user.nil? 
		#first ad of a new user - need to show user creation fields as well
		know_user(User.basic_user(nil, params[:user][:email]))
   	else 
		#subsequent ad of existent user - need to show only ad fields
		know_user(user)
    end

	#add a new ad
    redirect_to new_ad_path
  end

end
