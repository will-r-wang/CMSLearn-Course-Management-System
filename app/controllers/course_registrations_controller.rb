class CourseRegistrationsController < ApplicationController
  before_action :admin_authorization

  def approve
    course_registration = CourseRegistration.find(params[:id])
    user = course_registration.user
    course = course_registration.course

    raise "Invalid user_type" unless user.kind_of?(Student)

    ActiveRecord::Base.transaction do
      course_registration.update!(status: "approved")
      flash[:notice] = "Approved #{user.full_name}'s request to register in course #{course.course_name}"
    end

    redirect_to root_path
  end

  def deny
    course_registration = CourseRegistration.find(params[:id])
    user = course_registration.user
    course = course_registration.course

    raise "Invalid user_type" unless user.kind_of?(Student)

    ActiveRecord::Base.transaction do
      course_registration.update!(status: "denied")
      flash[:notice] = "Denied #{user.full_name}'s request to register in course #{course.course_name}"
    end

    redirect_to root_path
  end

  private

  def admin_authorization
    unless admin?
      flash[:error] = "Only admins are able to approve or deny course registration requests"
      redirect_to root_path
    end
  end
end
