class ContactMailer < ApplicationMailer
  def contact_submission(contact_info)
    @contact_info = contact_info
    mail(
      to: 'mikeh112@hotmail.com',
      subject: 'New Contact Form Submission'
    ) do |format|
      format.html
    end
  end

  def contact_email(user)
    @user = user
    mail(
      to: @user.email,
      subject: 'Contact Form Submission'
    ) do |format|
      format.html { render 'contact_submission' }
    end
  end
end