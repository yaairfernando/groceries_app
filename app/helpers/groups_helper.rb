# frozen_string_literal: true

module GroupsHelper
  def update_icon_url(value)
    @group = Group.last
    @group.icon = value['url']
    @group.save
  end
end
