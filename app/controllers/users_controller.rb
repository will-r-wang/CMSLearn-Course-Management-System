class UsersController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]
  before_action :set_user, only: %i[ show edit update destroy ]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params.except(:user_type))

    if @user.save
      begin
        create_user_registration
      rescue
        flash[:error] = "Error creating user registration"
        @user.destroy
        redirect_to new_user_path
      else
        flash[:notice] = "User successfully registered. Expect the status of registration to be updated in a few days."
        redirect_to '/login'
      end
    else
      flash[:error] = @user.errors
      redirect_to new_user_path
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :username, :password, :user_type)
  end

  def create_user_registration
    UserRegistration.create!(status: "pending", user_type: user_params[:user_type], user: @user)
  end
end
