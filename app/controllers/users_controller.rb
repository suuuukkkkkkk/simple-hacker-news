class UsersController < ApplicationController
  before_action :prevent_logged_in_user_access
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      login(@user)
      redirect_to root_path, notice: 'Logged in'
    else
      #render :new
      redirect_to login_a_path, notice: 'Username can only contain letters,digits, dashes and underscores. Password must contain at least one uppercase letter, one special character, one number and one lowercase letter '
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
