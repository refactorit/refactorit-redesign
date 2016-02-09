class ContactMailer < ApplicationMailer
  default from: 'contact@refactorit.co'
  def contact_email
    mail(to: "test@email.com", subject: "Test")
  end
end
