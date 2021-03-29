class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]
  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to '/login'
    else
      flash[:error] = "Incorrect username or password."
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end
end
