module ApplicationHelper
  
  def markdown(text)
    renderer = Redcarpet::Render::HTML.new(:hard_wrap => true)
    options = { :no_intra_emphasis => true,
                :fenced_code_blocks => true,
                :autolink => true,
                :space_after_headers => true }
    Redcarpet::Markdown.new(renderer, options).render(text).html_safe
  end

  def truncate_by_paragraph(text, num=1)
    # since I'm not sure if the text will have \r, \n or both I'm swapping
    # all \r characters for \n, then splitting at the newlines and removing
    # any blank characters from the array
    array = text.gsub("\r", "\n").split("\n").reject { |i| i == "" }
    array.take(num).join("\n")
  end

  def remove_images(text)
    text.gsub(/<img([^>])+/, "")
  end

  def gravatar_picture(user, size)
    gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
    "http://gravatar.com/avatar/#{gravatar_id}.png?d=identicon&size=#{size}"
  end

end
