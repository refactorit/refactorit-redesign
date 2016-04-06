class News < ApplicationRecord
  validates :title, :description, :published, presence: true
end
