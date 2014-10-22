class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @users = User.all
    authorize User
  end

  def show
    @user = User.find(params[:id])
    unless @user == current_user or current_user.has_role? :admin
      redirect_to :back, :alert => "Access denied."
    end
    @roles = Role.all.pluck(:name, :id)
  end
end
