class ContactForm
  include ActiveModel::Model

  attr_accessor :email
  attr_accessor :name
  attr_accessor :message

  validates :email, :name, :message, presence: true
  validates_format_of :email, with: Devise::email_regexp
end
