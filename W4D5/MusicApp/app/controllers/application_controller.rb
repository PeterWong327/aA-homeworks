class ApplicationController < ActionController::Base

  helper_method :current_user, :logged_in?

  def redirect_if_signed_in
    redirect_to :index if current_user
  end

  def current_user
    return nil unless session[:session_token]
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def login_user!(user)
    session[:session_token] = user.reset_session_token!
    # redirect_to :index
  end

  def logged_in?
    !current_user.nil?
  end

end
