class PagesController < ApplicationController
  skip_before_action :authorized

  def home
    unless logged_in?
      redirect_to '/login'
    end

    if admin?
      @user_registrations = UserRegistration.where(status: "pending")
    else
      @user_registration = UserRegistration.find_by(user_id: current_user&.id)
    end
  end
end
