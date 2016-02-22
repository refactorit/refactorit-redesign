class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :rememberable, :trackable, :validatable

  has_many :posts, foreign_key: 'author_id'
  validates :name, presence: true
  before_save :name_to_slug

  def name_to_slug
    self.slug = Slugifier.new(name).slugify
  end
end
