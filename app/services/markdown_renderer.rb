class MarkdownRenderer
  require 'rouge'
  require 'rouge/plugins/redcarpet'

  # We extend the default Redcarpet renderer with Rouge functionality which allows
  # us to use syntax highlighting
  class HTMLRenderer < Redcarpet::Render::HTML
    include Rouge::Plugins::Redcarpet
  end

  def initialize
    @markdown = Redcarpet::Markdown.new(HTMLRenderer,
      { fenced_code_blocks: true, disable_indented_code_blocks: true })
  end

  def render_text(text)
    @markdown.render(text).html_safe
  end
end
