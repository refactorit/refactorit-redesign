class News < ApplicationRecord
  validates :title, :description, presence: true

  scope :published, -> { where(published: true) }
end
