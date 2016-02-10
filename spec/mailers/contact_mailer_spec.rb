require "rails_helper"

describe ContactMailer do
  let(:contact) {  FactoryGirl.build(:contact_form) }

  it "#contact_email has correct headers" do
    sent_email = ContactMailer.contact_email(contact).deliver
    expect(sent_email.to).to eq ["contact@refactorit.co"]
    expect(sent_email.from).to eq ["contact@refactorit.co"]
    expect(sent_email.subject).to eq "#{contact.name} has a question"
  end
end
