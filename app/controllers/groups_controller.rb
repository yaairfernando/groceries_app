class GroupsController < ApplicationController
  before_action :find_group, only: %i[show]

  def index

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
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon)
  end

  def find_group
    @gropu = Group.find(params[:id])
  end
end
