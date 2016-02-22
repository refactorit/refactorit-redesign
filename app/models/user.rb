class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  include FriendlyId
  include Slugable
  friendly_id :slug, use: :slugged

  devise :database_authenticatable,
         :rememberable, :trackable, :validatable

  has_many :posts, foreign_key: 'author_id'
  validates :name, presence: true

  before_save :assign_slug

  def assign_slug
    self.slug ||= slugify(name)
  end
end
