class ContactFormController < ApplicationController

  def create
    @name = params[:contact_form][:first_name]
    @last_name = params[:contact_form][:last_name]
    @email = params[:contact_form][:email]
    @message = params[:contact_form][:message]
    flash[:notice] = "Your message has been sent successfully."
    redirect_to :contact_form
  end

  def index
    render 'contact_mailer/contact_submission'
  end

end