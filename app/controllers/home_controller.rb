class HomeController < ApplicationController

  def index
    @user = current_user
    @showlogin = false
    if params[:logout]
      @showlogin = true
    end

  end

  def new

  end


  def create

  end

  def show

  end

end
