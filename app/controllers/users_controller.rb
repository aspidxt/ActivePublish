class UsersController < ApplicationController

  private

  def users_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end


  public

  def new
    @user = User.new
  end

  def create
    @user = User.new(users_params)
    @user.build_chat_user(nickname: @user.email)
    if @user.save
      flash[:success] = "Account registered!"
      redirect_to root_path
    else
      render :new
    end
  end

end
