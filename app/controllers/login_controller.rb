class LoginController < ApplicationController
  def show
  end

  def go_home
    if params[:email] == 'allshouseandrew@gmail.com'
      redirect_to home_url
    end
  end
end
