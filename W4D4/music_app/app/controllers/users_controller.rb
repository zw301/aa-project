class UsersController < ApplicationController
  before_action :require_current_user!, except: [:create, :new]


  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      log_in!(@user)
      # render :show
      redirect_to user_url(@user)
      # render plain: 'yessssssss'
    else
      flash.now[:errors] ||= []
      flash.now[:errors] << "Invalid email or password, try again"
      # flash[:errors] = @user.errors.full_messages
      render :new

      # redirect_to new_user_url
      # render plain: 'noooooooo'
    end
  end
  #
  # def show
  #   @user = User.find_by(id: params[:id])
  #   render :show
  # end


  def show
    @user = User.find_by(id: params[:id])
    if @user.id == current_user.id
      render :show
    else
      redirect_to user_url(current_user)
    end
  end



  private

  def user_params
    self.params.require(:user).permit(:email, :password)
  end


end
