module UsersHelper

    # Returns the Gravatar for the given user.
    def gravatar_for(user, options = { size: 80 })
        size         = options[:size]
        gravatar_id  = Digest::MD5::hexdigest(user.email.downcase)
        gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
        image_tag(gravatar_url, alt: user.name, class: "gravatar")
    end

    def avatar_for(user, options = { size: 80 })
        if user.avatar_url.present?
            image_tag user.avatar_url, class: "avatar-#{options[:size]}", 
                                    alt: user.name,
                                    style: "width: #{options[:size]}px; height: #{options[:size]}px;"
        else
            # Fallback avatar nếu không có avatar từ GitHub
            image_tag "default-avatar.png", class: "avatar-#{options[:size]}"
        end
    end
end