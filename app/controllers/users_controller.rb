class UsersController < ApplicationController
    before_action :authenticate_user!
  
    def dashboard
      @user = current_user
      @chassis = @user.chassis
      @engines = @user.engines
    end
end