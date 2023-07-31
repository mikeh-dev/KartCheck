class NotifierMailer < ApplicationMailer

  def welcome
    @greeting = "Hi"
    mail to: "mikeh112@hotmail.com", subject: "Welcome to the site!"
  end

end
