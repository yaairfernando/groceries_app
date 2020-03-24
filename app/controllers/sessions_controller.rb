class SessionsController < ApplicationController
  def new
    # redirect_to signup_path unless !logged_in?
  end

  def create
    @user = User.find_by(name: params[:session][:name])
    if @user
      log_in @user
      flash[:success] = "Welcome back #{@user.name}..!!"
      redirect_to current_user
    else
      flash.now[:danger] = 'Please check your username.'
      render :new
    end
  end

  def destroy
    log_out current_user
    redirect_to signup_path
  end
end
