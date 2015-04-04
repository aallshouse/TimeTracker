class UsersController < ApplicationController
  before_filter :authenticate_user!

  respond_to :html, :js

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
    gon.not_my_roles = @user.roles_i_dont_have
    gon.update_user_path = "/users/#{@user.id}"
  end

  def update
    @user = User.find(params[:id])
    roles = params[:roles]
    index = 0

    all_roles = Role.all
    all_roles.each { |r| @user.roles.delete(r) }

    while index < roles.length do
      role = Role.find(roles[index])
      role_name = role.name.to_sym
      @user.add_role(role_name) if @user.has_role?(role_name) == false
      index = index + 1
    end

    respond_to do |format|
        format.js { render json: {} }
    end
  end
end
