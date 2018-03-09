class UsersController < ApplicationController

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in!(@user)
      redirect_to user_url(@user)
    else
      redirect_to new_user_url
    end
  end

  def show
    render plain: "lalala"
  end

  private

  def user_params
    self.params.require(:user).permit(:username, :password)
  end

end
