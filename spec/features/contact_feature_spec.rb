require 'rails_helper'

feature "Contact" do
  context "guest visits new page" do
    before { visit contact_new_path }

    specify "he can see the correct title" do
      expect(page).to have_title 'Refactorit'
    end

    specify "he can see the contact form" do
      expect(page).to have_field :contact_form_email
      expect(page).to have_field :contact_form_name
      expect(page).to have_field :contact_form_message
      expect(page).to have_button :contact_submit
    end

    context "guest submits an incorrectly filled form" do
      before do
        fill_in :contact_form_email, with: "test@example.com"
        click_button :contact_submit
      end

      specify "he can see the contact form with pre-filled fields" do
        expect(page).to have_field :contact_form_email, with: "test@example.com"
        expect(page).to have_field :contact_form_name
        expect(page).to have_field :contact_form_message
      end

      specify "he can see validation errors" do
        expect(page).to have_content "can't be blank"
      end
    end

    context "guest submits correctly filled form" do
      before do
        fill_in :contact_form_email, with: "test@example.com"
        fill_in :contact_form_name, with: "potential@customer.com"
        fill_in :contact_form_message, with: "This is a message with questions?"
        click_button :contact_submit
      end

      specify "he can see the contact form" do
        expect(page).to have_field :contact_form_email
        expect(page).to have_field :contact_form_name
        expect(page).to have_field :contact_form_message
      end

      specify "he can see the success message" do
        expect(page).to have_content "E-mail succesfully sent"
      end
    end
  end
end
