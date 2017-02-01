require 'rails_helper'

feature 'Footer' do
  context "anybody visits home page" do
    before { visit root_path }

    specify "she sees correct footer links" do
      expect(page).to have_link "Home", href: root_path
      expect(page).to have_link "Contact", href: contact_new_path
      expect(page).to have_link "Services", href: services_path
    end
  end
end
