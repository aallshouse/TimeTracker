class UserPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @model = model
  end

  def index?
    @current_user.email.eql?('allshouseandrew@aol.com')
  end
end