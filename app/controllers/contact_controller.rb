class ContactController < ApplicationController
  def send_question
    ContactMailer.contact_email.deliver
    redirect_to root_path
  end
end
