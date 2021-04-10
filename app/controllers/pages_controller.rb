class PagesController < ApplicationController
  def home
    if current_user.type == "Admin"
      @user_registrations = UserRegistration.where(status: "pending") 
      @course_registrations = CourseRegistration.includes(:user, :course).where(status: "pending")
    end
    @courses_teaching = Course.includes(:semester).where(teacher_id: current_user.id) if current_user.type == "Teacher"
    @user_registration = UserRegistration.find_by(user_id: current_user.id, status: "pending")

    @course_results = if params[:filter].present?
      params[:filter].strip!
      Course.includes(:teacher, :semester).where("course_name = ? OR course_code = ?", params[:filter], params[:filter])
    end
  end
end
