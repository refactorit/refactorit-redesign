class News < ApplicationRecord
  validates :title, :description, presence: true

  scope :published, -> { where(published: true) }
  before_save :update_published_date

  def update_published_date
    if published? && published_at.nil?
      self.published_at = Time.now
    end
  end
end
