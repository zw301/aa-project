class SessionsController < ApplicationController


  #SessionsController#create should re-set the appropriate user's
  #session_token and session[:session_token].

  def create
    @user = User.find_by_credentials(
      params[:user][:email],
      params[:user][:password]
    )
    if @user.nil?
      flash.now[:error] ||= []
      flash.now[:error] << 'Invalid input, please try again'
      render :new
      # NO!!!redirect_to :new
      # render plain: 'Not exist'
    else

      log_in!(@user)
      redirect_to user_url(@user)

      # render plain: "YES"
      # redirect_to user_url(@user)
    end
  end

  def destroy
    log_out!
    redirect_to new_session_url
  end

  #For now just redirect them to a User#show page which simply
  #displays that user's email.
  def new
    render :new
  end

end
