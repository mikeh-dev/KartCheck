class UsersController < ApplicationController
  before_action :authenticate_user!

  def dashboard
    @user = current_user
    @chassis = current_user.admin? ? Chassis.all : @user.chassis
    @engines = current_user.admin? ? Engine.all : @user.engines
  end
end
