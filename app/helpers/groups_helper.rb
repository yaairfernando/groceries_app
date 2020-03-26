module GroupsHelper
  def edit_icon value
    group = Group.last
    byebug
    group.icon = value['url']
    group.save
  end
end
