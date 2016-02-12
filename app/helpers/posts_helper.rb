module PostsHelper

  def markdown_to_html(text)
    MarkdownRenderer.new.render_text(text)
  end
end
