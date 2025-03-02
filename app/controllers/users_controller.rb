class UsersController < ApplicationController
  load_and_authorize_resource

  def index
    @users = User.all
  end

  def show
    @joined_on = @user.created_at.to_formatted_s(:short)

    if @user.current_sign_in_at
      @last_login = @user.current_sign_in_at.to_formatted_s(:short)
    else
      @last_login = 'never'
    end
  end

  def new
  end

  def edit
  end

  def create
    if @user.save
      redirect_to @user, notice: "User was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if user_params[:password].blank?
      user_params.delete(:password)
      user_params.delete(:password_confirmation)
    end
  
    successfully_updated = if needs_password?(@user, user_params)
                             @user.update(user_params)
                           else
                             @user.update_without_password(user_params)
                           end
  
    if successfully_updated
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @user.destroy!
    redirect_to users_path, notice: "User was successfully destroyed.", status: :see_other
  end

  private
    def user_params
      params.expect(user: [ :email, :password, :password_confirmation, :name, :role_id ])
    end

    def needs_password?(_user, params)
      params[:password].present?
    end
end
