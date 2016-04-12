module PostsHelper

  def markdown_to_html(text)
    MarkdownRenderer.new.render_text(text)
  end

  # takes in ActiveSupport::TimeWithZone
  def format_date(date)
    date.strftime(" %d / %m / %Y")
  end
end
