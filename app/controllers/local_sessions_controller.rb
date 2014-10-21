class LocalSessionsController < Devise::SessionsController

  def new
    # flash[:notice] = 'hello from my sessions controller'

    super
  end

  def create
    super
  end
end