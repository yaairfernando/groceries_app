class UsersController < ApplicationController
  before_action :find_user, only: %i[show]
  before_action :user_params, only: %i[create]

  def new
    redirect_to root_path unless !logged_in?
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      log_in @user
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def groups
    @groups = Group.all.where('creator_id = ?', current_user.id).order('name ASC')
  end

  def external_transactions
    @transactions = current_user.purchases.includes(:group, :creator).where(group_id: [nil, '']).order('name ASC')
    @total = current_user.purchases.where(group_id: [nil, '']).sum('amount')
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name)
  end
end
