class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?

  def current_user
    return nil if self.session[:session_token].nil?
    @user ||= User.find_by(session_token: self.session[:session_token])
  end

  def log_in!(user)
    user.reset_session_token!
    # log user in
    self.session[:session_token] = user.session_token
  end

  def logged_in?
    !!current_user
  end

  def log_out!
    self.session[:session_token] = nil
  end

end
