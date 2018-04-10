class SessionsController < ApplicationController
  def new
    if logged_in?
      redirect_to current_user
    end
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      flash[:success] = 'Welcome to the Sample App!'
      redirect_to user
    else
      flash[:danger] = 'Invalid email / password combination'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
