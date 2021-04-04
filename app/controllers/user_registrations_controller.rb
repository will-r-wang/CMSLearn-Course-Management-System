class UserRegistrationsController < ApplicationController
  skip_before_action :authorized

  def approve
    user_registration = UserRegistration.find(params[:id])
    user = user_registration.user

    user_registration.update!(status: "approved")

    case user_registration.user_type
    when 'student'
      flash[:notice] = "Approved #{user.full_name}'s request to register as a Student"
      user.becomes!(Student)
      user.save
    when 'admin'
      flash[:notice] = "Approved #{user.full_name}'s request to register as an Admin"
      user.becomes!(Admin)
      user.save
    when 'teacher'
      flash[:notice] = "Approved #{user.full_name}'s request to register as a Teacher"
      user.becomes!(Teacher)
      user.save
    else
      raise "Invalid user_type"
    end

    redirect_to root_path
  end

  def deny
    user_registration = UserRegistration.find(params[:id])
    user = user_registration.user

    user_registration.update!(status: "denied")

    flash[:notice] = "Denied #{user.full_name}'s request to register as a #{user_registration.user_type}"
    redirect_to root_path
  end
end
