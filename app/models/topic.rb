class Topic < ApplicationRecord
  include FriendlyId
  friendly_id :slug, use: :slugged
  include Slugable

  has_many :posts
  before_save :assign_slug

  validates :name, presence: true
  validates :slug, uniqueness: true

  def assign_slug
    self.slug ||= slugify(name)
  end
end
