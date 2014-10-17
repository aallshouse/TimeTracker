class Users::SessionsController < Devise::SessionsController

  def new
    flash[:notice] = 'hello from my sessions controller'

    super
  end
end