require 'rails_helper'

feature "Attachment administration" do
  context "logged in user and two attachments exist" do
    let(:user) { FactoryGirl.create(:user) }
    let!(:attachments) { FactoryGirl.create_list(:attachment, 2) }
    before { login_as(user, scope: :user) }

    describe "on index page" do
      before { visit attachments_path }
      specify "user sees attachments" do
        expect(page).to have_content attachments.first.image_file_name
        expect(page).to have_content attachments.second.image_file_name
      end

      specify "user sees new image link" do
        expect(page).to have_link "New Image", href: new_attachment_path
      end

      specify "user sees delete image links" do
        expect(page).to have_link "Destroy", href: attachments_path(attachments.first)
        expect(page).to have_link "Destroy", href: attachments_path(attachments.second)
      end
    end

    describe "on new page" do
      before { visit new_attachment_path }

      specify "user sees the form" do
        expect(page).to have_field :attachment_image
        expect(page).to have_button "Create attachment"
      end

      describe "user submits the form correctly" do
        let(:image_location) { "#{Rails.root}/spec/fixtures/test.png" }
        before do
          attach_file :attachment_image, image_location
          click_button "Create attachment"
        end

        specify "and sees the index page after submitting with the new image" do
          expect(page).to have_content "Image succesfully created"
          expect(page).to have_content "test.png"
        end
      end

      describe "user submits the form incorrectly" do
        before do
          click_button "Create attachment"
        end

        specify "and sees the form again with validation error" do
          expect(page).to have_content "can't be blank"
          expect(page).to have_field :attachment_image
          expect(page).to have_button "Create attachment"
        end
      end
    end
  end
end
