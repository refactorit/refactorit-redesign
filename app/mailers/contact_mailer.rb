class ContactMailer < ApplicationMailer
  default from: 'contact@refactorit.co'
  def contact_email(contact)
    @contact = contact
    mail(to: "test@email.com", subject: "Test")
  end
end
