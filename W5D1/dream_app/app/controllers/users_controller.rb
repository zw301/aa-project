class UsersController < ApplicationController
  def index
  end

  def new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      login(@user)
      redirect_to users_url
    else
      flash[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def edit
  end

  def update
  end

  def show
    @user = User.find(params[:id])
    render :show
  end

  def destroy
  end

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
