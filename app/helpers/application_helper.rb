module ApplicationHelper
  
  def markdown(text)
    renderer = Redcarpet::Render::HTML.new(:hard_wrap => true)
    options = { :no_intra_emphasis => true,
                :fenced_code_blocks => true,
                :autolink => true,
                :space_after_headers => true }
    Redcarpet::Markdown.new(renderer, options).render(text).html_safe
  end

  def gravatar_picture(user, size)
    gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
    "http://gravatar.com/avatar/#{gravatar_id}.png?d=identicon&size=#{size}"
  end

end
