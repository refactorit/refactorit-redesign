require 'rails_helper'
describe ContactForm do
  it { should validate_presence_of :email }
  it { should validate_presence_of :name }
  it { should validate_presence_of :message }
  it { should allow_value("person@example.com").for(:email) }
  it { should_not allow_value("person_email").for(:email) }
end
