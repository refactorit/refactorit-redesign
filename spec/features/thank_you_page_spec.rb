require 'rails_helper'

feature "Thank You Page" do

  before { visit thank_you_path }

  specify "user can see thank you message" do
    expect(page).to have_content "Thank you for getting in touch!"
    expect(page).to have_content "We will look over your message and get back to you soon."
  end
end

