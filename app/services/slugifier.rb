class Slugifier
  require 'I18n'
  def initialize(text)
    @text = text
  end

  def slugify
    # removes accents from diacritics e.g. ć becomes c
    transliterated_text = I8n.transliterate(@text)
    transliterated_text.downcase.gsub(/\s+/, "-")
  end

  def deslugify
    @text.downcase.gsub("-", " ")
  end
end
