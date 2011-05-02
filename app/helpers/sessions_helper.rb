module SessionsHelper

  def sign_in(user)
	#be login by default just for the current day
    cookies.permanent.signed[:remember_token] = { :value => [user.id, user.salt], :expires => 1.day.from_now }
    self.currently_signedin_user = user
	#signed_in user is the currently known user
	miss_known_user
  end

  def sign_out
    cookies.delete(:remember_token)
    self.currently_signedin_user = nil
  end

  def signed_in?
    !currently_signedin_user.nil?
  end

  def currently_signedin_user=(user)
    @current_user = user
  end

  def currently_signedin_user
    @current_user ||= user_from_remember_token
  end

  private

    def user_from_remember_token
      User.authenticate_with_salt(*remember_token)
    end

    def remember_token
      cookies.signed[:remember_token] || [nil, nil]
    end
end
