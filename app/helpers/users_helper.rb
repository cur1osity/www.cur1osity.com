module UsersHelper

 # Returns the Gravatar for the given user.
  def gravatar_for(user, options = { size: 80 })
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
    end

 def avatar_for_profile(user)
  if user.picture.blank?
    gravatar_for user, options = {size: 50}
  else
    image_tag user.picture_url(:thumb), alt: user.name, class: "avatarX"
  end 
end

  def avatar_for_follow(user)
   if user.picture.blank?
     gravatar_for user, options = {size: 20} 
   else
     image_tag user.picture_url(:small), alt: user.name
  end 
end

end
