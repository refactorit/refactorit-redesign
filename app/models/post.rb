class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  validates :title, :body, presence: true

  before_save :assign_slug
  before_save :strip_title

  def assign_slug
    self.slug ||= title_to_slug
  end

  def strip_title
    self.title = self.title.strip
  end

  def title_to_slug
    title.downcase.gsub(/\s+/, "-")
  end
end
