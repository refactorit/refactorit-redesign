module Slugable
  extend ActiveSupport::Concern

  def slugify(text)
    # removes accents from diacritics e.g. ć becomes c
    transliterated_text = I18n.transliterate(text)
    transliterated_text.downcase.strip.gsub(/\s+/, "-")
  end
end
