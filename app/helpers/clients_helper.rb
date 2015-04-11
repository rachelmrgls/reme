module ClientsHelper
  # Returns the Gravatar for the given user.
  def gravatar_for(client, options = { size: 80 })
    gravatar_id = Digest::MD5::hexdigest(client.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}&d=identicon"
    image_tag(gravatar_url, alt: client.name, class: "gravatar")
  end
end
