class ContactMailerPreview < ActionMailer::Preview
  def contact_email
    user = User.first
    ContactMailer.contact_email(user)
  end
end
