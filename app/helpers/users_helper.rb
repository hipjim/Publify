module UsersHelper
	#1 hour is more than enough to add a new ad
	def know_user(user)
    	cookies.signed[:user_data] = { :value => [user.name, user.email], :expires => 1.hour.from_now}
		self.currently_known_user = user
  	end

	def miss_known_user
    	cookies.delete(:user_data)
    	self.currently_known_user = nil
  	end


  	def known_user?
    	!currently_known_user.nil?
  	end

  	def currently_known_user=(user)
    	@known_user = user
  	end

  	def currently_known_user
    	@known_user ||= user_from_token
  	end

  private

    def user_from_token
      User.basic_user(*user_data)
    end

    def user_data
      cookies.signed[:user_data] || [nil, nil]
    end
end
