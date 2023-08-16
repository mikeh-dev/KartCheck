class HomeController < ApplicationController
  def index
    @user = current_user
    @engines = []
    @chassis = []

    if params[:q].present?
      @engines = Engine.where("LOWER(engine_number) = ?", params[:q].downcase)
      @chassis = Chassis.where("LOWER(number) = ?", params[:q].downcase)
    else
      @engines = Engine.none
      @chassis = Chassis.none
    end
  end

  def about
  end

  def new_contact
    @contact_info = Contact.new
  end

  def create_contact
  @contact_info = Contact.new(contact_params)

  if @contact_info.save
    ContactMailer.contact_submission(@contact_info).deliver_now
    redirect_to root_path, notice: 'Your message was sent successfully, you will hear back from us soon.'
  else
    flash.now[:alert] = 'There was an error submitting your message.'
    render :new_contact, status: :unprocessable_entity
  end
end

private
  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :company, :email, :phone_number, :message)
  end
end