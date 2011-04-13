class AdsController < ApplicationController
  def new
	#cannot continue without a known user
	if !known_user?
		redirect_to root_path
		return
	end
	@title = "Adaugare Anunt"
	@ad = Ad.new
	@local_user = User.new
  end

  def show
	#possibly not needed
	if !signed_in?
		redirect_to root_path
		return
	end
  end

  def create
	#new users are automatically singed in, known users must be authenticated
   	if currently_known_user.name.nil?
		#new user and ad
		@local_user = User.new(params[:ad][:user])
		#field disabled in form
		@local_user.email = currently_known_user.email
		@ad = Ad.new(params[:ad])
		if @local_user.save
			@ad.user_id = @local_user.id
			if !@ad.save
				#give a new chance and show ad errors
				render 'new'
				return
			end
		else
			#give a new chance and show user errors
			render 'new'
			return
		end
	else
		#known user -> add just the new ad
		#check user in DB
		if known_user?
			@local_user = User.authenticate(currently_known_user.email, params[:ad][:password])
		else 
			@local_user = currently_signedin_user
		end
		if !@local_user.nil?
			@ad = Ad.new(params[:ad])
			@ad.user_id = @local_user.id
			if !@ad.save
				#show ad errors
				render 'new'
				return
			end
		else 
			flash.now[:error] = "Incorrect password"
			render 'new'
			return
		end
	end
	
	#new ad added go to user profile
	flash.now[:success] = "Ati salvat un nou anunt!"
	if !signed_in?
		sign_in @local_user
	end

	#no activation email - activation could be executed from profile page
	redirect_to profile_path
  end

end
