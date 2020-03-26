class GroupsController < ApplicationController
  include GroupsHelper
  before_action :find_group, only: %i[show]

  def index
    @groups = current_user.groups.includes(:purchases).order('name ASC')
  end

  def new
    @group = current_user.groups.build
  end

  def create
    # byebug
    @group = current_user.groups.build(group_params)
    @value = Cloudinary::Uploader.upload(params[:group][:icon])
    @group.icon = @value['url']
    # @group.icon = @group.icon.url[0..-5]

    byebug
    # create a new post object and save to db
    # @post = Post.new({:link => @value['secure_url'], :caption => params[:caption]})
    if @group.save
      # edit_icon @value
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
    params.require(:group).permit(:name, :icon, :creator_id)
  end

  def find_group
    @group = Group.find(params[:id])
  end
end
