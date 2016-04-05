class Post < ApplicationRecord
  include FriendlyId
  include Slugable

  friendly_id :slug, use: :slugged

  belongs_to :author, class_name: 'User'
  belongs_to :topic
  
  validates :topic, presence: true
  validates :title, :body, presence: true
  validates :slug, :title, uniqueness: true

  before_save :assign_slug
  before_save :strip_title
  before_save :change_published_date

  enum status: [:draft, :published]
  scope :published_with_authors, -> { published.includes(:author) }

  delegate :name, :slug, to: :author, prefix: true

  def assign_slug
    self.slug ||= slugify(title)
  end

  def strip_title
    # if statement is here because it messes up validation tests
    # in practical usage it shouldn't be necessary since we check for
    # title's presence
    self.title = self.title.strip if self.title.present?
  end

  # necessary for select inputs in forms, since enum is a number and
  # forms send strings
  def self.status_keys
    self.statuses.keys
  end

  def self.default_status
    "draft"
  end

  private

    def change_published_date
      if draft? && published_at.present?
        self.published_at = nil
      elsif published? && published_at.nil?
        self.published_at = Time.now
      end
    end

end
