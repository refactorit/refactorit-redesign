require 'rails_helper'

feature 'Navigation' do
  context "guest visits home page" do
    before { visit root_path }

    specify "he sees correct navigation links" do
      expect(page).to have_link "About us"
      expect(page).to have_link "Team"
      expect(page).to have_link "Contact us"
      expect(page).to have_link "Services"
    end
  end
end
