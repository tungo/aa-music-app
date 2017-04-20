class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(session_params)
    if @user
      login!(@user)

      @user.reset_session_token!
      session[:session_token] = @user.session_token

      redirect_to user_url(@user)
    else
      flash.now[:errors] = "Can not login"
      render :new
    end
  end

  def destroy
    current_user.reset_session_token!
    session[:session_token] = nil
    redirect_to session_url
  end

  private

  def session_params
    params.require(:user).permit(:email, :password)
  end
end
