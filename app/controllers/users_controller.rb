class UsersController < ApplicationController
  def new
    render :new
  end

  def create
    @user = User.new(user_params)
    # @user.password = params[:password]

    if @user.save
      log_in_user!(@user)
      redirect_to user_url(@user)
    else
      flash.now[:errors] = "Can not create new user"
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    render :show
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
