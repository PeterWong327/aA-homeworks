class UsersController < ApplicationController

before_action :redirect_if_signed_in, only: [:new]

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      login_user!(@user)
      render plain: "im here!"
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to new_user_url
    end
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end

  def show
    render :show
  end


end
