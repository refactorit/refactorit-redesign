require 'rails_helper'

RSpec.describe Attachment, :type => :model do
  describe 'validations' do
    it 'should have a valid factory for image attachments' do
      FactoryGirl.build(:attachment)
    end

    it { should have_attached_file(:image) }
    it { should validate_attachment_presence(:image) }
    it { should validate_attachment_content_type(:image).
                  allowing('image/png', 'image/gif').
                  rejecting('text/plain', 'text/xml') }
  end

end
