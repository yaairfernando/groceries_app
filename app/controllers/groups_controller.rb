# frozen_string_literal: true

class GroupsController < ApplicationController
  include GroupsHelper
  before_action :find_group, only: %i[show]

  def index
    @groups = current_user.groups.order('name ASC')
  end

  def new
    @group = current_user.groups.build
  end

  def create
    @group = current_user.groups.build(group_params)
    if @group.save
      @value = Cloudinary::Uploader.upload(params[:group][:icon])
      update_icon_url @value
      flash[:success] = 'A new group has been added!!'
      redirect_to groups_path
    else
      render :new
    end
  end

  def show
    @total = @group.purchases.sum('amount')
    @purchases = @group.purchases.includes(:creator, :group)
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon, :creator_id)
  end

  def find_group
    @group = Group.find(params[:id])
  end
end
