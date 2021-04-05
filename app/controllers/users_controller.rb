class UsersController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]
  before_action :set_user, only: %i[ show edit update destroy ]

  def index
    @users = klass.all
  end

  def new
    @user = klass.new
  end

  def create
    @user = klass.new(user_params.except(:user_type))

    if @user.save
      begin
        create_user_registration
      rescue
        flash[:error] = "Error creating user registration"
        @user.destroy
        redirect_to new_user_path
      else
        flash[:notice] = "#{klass.name} successfully registered. Expect the status of registration to be updated in a few days."
        redirect_to '/login'
      end
    else
      flash[:error] = @user.errors
      redirect_to new_user_path
    end
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "#{klass.name} was successfully updated."
      redirect_to root_path
    else
      flash[:notice] = @user.errors
      redirect_to edit_user_path(@user)
    end
  end

  def destroy
    @user.destroy
    flash[:notice] = "#{klass.name} was successfully destroyed."
    redirect_to root_path
  end

  private
  def set_user
    @user = klass.find(params[:id])
  end

  def klass
    Object.const_get params[:controller].classify
  end

  def user_params
    params.require(klass.name.underscore.to_sym).permit(:first_name, :last_name, :email, :username, :password, :user_type)
  end

  def create_user_registration
    UserRegistration.create!(status: "pending", user_type: user_params[:user_type], user: @user)
  end
end
