class HomeController < ApplicationController
  def index
    @user = current_user
    @engines = Engine.all

  end

  def about
  end

  def contact
  end

  def calendar
  end

end
