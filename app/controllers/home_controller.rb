class HomeController < ApplicationController
  def index
    @user = current_user
  end

  def about
  end

  def contact
  end

  def calendar
  end

end
