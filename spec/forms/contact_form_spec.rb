require 'rails_helper'
describe ContactForm do
  it { should validate_presence_of :email }
  it { should validate_presence_of :name }
  it { should validate_presence_of :message }
end
