module ApplicationHelper
  
  def markdown(text)
    renderer = Redcarpet::Render::HTML.new(:hard_wrap => true)
    options = { :no_intra_emphasis => true,
                :fenced_code_blocks => true,
                :autolink => true,
                :space_after_headers => true }
    Redcarpet::Markdown.new(renderer, options).render(text).html_safe
  end
  
end
