class ContactMailer < ApplicationMailer
  def contact_submission(contact_info)
    @contact_info = contact_info
    mail(
      to: 'mikeh112@hotmail.com',
      subject: 'New Contact Form Submission'
    )
  end
end
