# frozen_string_literal: true

class SessionsController < ApplicationController
  def new
    redirect_to root_path if logged_in?
  end

  def create
    @user = User.find_by(name: params[:session][:username].downcase)
    if @user
      log_in @user
      redirect_to root_path
    else
      flash.now[:danger] = 'Please check your username.'
      render :new
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end
end
