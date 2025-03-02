class RolesController < ApplicationController
  before_action :authenticate_user!  
  load_and_authorize_resource

  def index
    @roles = Role.all
  end

  def show
    if @role.users.empty?
      @assosciated_user = 'None'
    else
      @assosciated_users = @role.users.map(&:name).join(', ')
    end
  end

  def new
  end

  def edit
  end

  def create
    if @role.save
      redirect_to @role, notice: "Role was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @role.update(role_params)
      redirect_to @role, notice: "Role was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @role.destroy!
    redirect_to roles_path, notice: "Role was successfully destroyed.", status: :see_other
  end

  private
    def role_params
      params.expect(role: [ :name, :description ])
    end
end
