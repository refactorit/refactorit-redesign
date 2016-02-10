class ContactController < ApplicationController
  def new
    @contact = ContactForm.new
  end

  def send_question
    @contact = ContactForm.new(contact_form_params)
    if @contact.valid?
      ContactMailer.contact_email(@contact).deliver
      redirect_to contact_new_path, notice: "E-mail succesfully sent"
    else
      render 'new'
    end
  end

  private

  def contact_form_params
    params.require(:contact_form).permit :email, :name, :message
  end
end
