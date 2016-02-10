class ContactMailer < ApplicationMailer
  default from: 'contact@refactorit.co'
  def contact_email(contact)
    @contact = contact
    mail(to: "contact@refactorit.co", subject: "#{@contact.name} has a question")
  end
end
