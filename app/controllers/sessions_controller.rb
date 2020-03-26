class SessionsController < ApplicationController
  def new
    redirect_to root_path unless !logged_in?
  end

  def create
    @user = User.find_by(name: params[:session][:username].downcase)
    if @user
      log_in @user
      flash.now[:success] = "Welcome back #{@user.name}..!!"
      redirect_to current_user
    else
      flash.now[:danger] = 'Please check your username.'
      render :new
    end
  end

  def destroy
    log_out
    redirect_to signup_path
  end
end
