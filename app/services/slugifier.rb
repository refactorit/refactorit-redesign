class Slugifier
  def initialize(text)
    @text = text
  end

  def slugify
    @text.downcase.gsub(/\s+/, "-")
  end

  def deslugify
    @text.downcase.gsub("-", " ")
  end
end
