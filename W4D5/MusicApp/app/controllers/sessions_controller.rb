class SessionsController < ApplicationController

  def new #log-in page
    @user = User.new
  end

  def create #process of logging in user
    @user = User.find_by_credentials(
      params[:user][:email],
      params[:user][:password]
    )
    if @user
      login_user!(@user)
      redirect_to users_url
    else
      flash[:errors] = ["Invalid email and password combination"]
      redirect_to :user
    end
  end

  def destroy  #logs the user out
    current_user.reset_session_token! if current_user
    session[:session_token] = nil
    redirect_to :new_session
  end

end
