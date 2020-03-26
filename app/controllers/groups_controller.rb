class GroupsController < ApplicationController
  before_action :find_group, only: %i[show]

  def index
    @groups = current_user.groups.includes(:purchases).order('name ASC')
  end

  def new
    @group = Group.new
  end

  def create
    # byebug
    @group = Group.new(group_params)
    @group.creator_id = current_user.id
    if @group.save
      flash[:success] = 'A new group has been added!!'
      redirect_to groups_path
    else
      render :new
    end
  end

  def show
    @total = @group.purchases.sum('amount')
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon)
  end

  def find_group
    @group = Group.find(params[:id])
  end
end
