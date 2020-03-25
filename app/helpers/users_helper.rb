module UsersHelper
  def gravatar_for(user, options = { size: 80 })
    gravatar_id = Digest::MD5.hexdigest(user.name.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    # byebug
    image_tag(gravatar_url, alt: user.name, class: 'gravatar')
  end

  def avatar_for(user, options = { size: 80 })
    @avatar = user.avatar
    if @avatar.empty?
        @avatar_user = image_tag("user.png", alt: user.name, width: width, height: height)
    else
        @avatar_user = image_tag(@avatar.url, alt: user.name, width: width, height: height)
    end
    return @avatar_user
  end
end
