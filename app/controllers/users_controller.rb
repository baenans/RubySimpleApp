class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(
      params.require(:user).permit(
        :name,
        :email,
        :password,
        :password_confirmation
      )
    )

    if @user.save
      log_in @user
      flash[:success] = "Hi #{@user.name}, welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
end
