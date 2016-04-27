module PostsHelper

  def markdown_to_html(text)
    MarkdownRenderer.new.render_text(text)
  end

  # takes in ActiveSupport::TimeWithZone
  def format_date(date)
    date.strftime(" %b %d, %Y")
  end

  def topic_icon(post)
    "#{post.topic_name.downcase}.svg"
  end
end
