class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save && @user.register
      flash[:notice] = "You've signed up successfully"
      flash[:color] = "valid"
    else
      flash[:notice] = "Whoops!"
      flash[:color] = "invalid"
    end
    render "new"
  end

  private

  def user_params
    params.require(:user).permit(:email)
  end

end
