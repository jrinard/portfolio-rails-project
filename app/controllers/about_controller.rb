class AboutController < ApplicationController


  def index
    @user = current_user
    @showlogin = false
    if params[:logout]
      @showlogin = true
    end
  end

end
