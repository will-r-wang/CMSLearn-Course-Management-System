class PagesController < ApplicationController
  skip_before_action :authorized

  def home
    redirect_to '/login' unless logged_in?

    @user_registrations = UserRegistration.where(status: "pending") if admin?
    @courses_teaching = Course.where(teacher_id: current_user.id) if teacher?
    @user_registration = UserRegistration.find_by(user_id: current_user.id) if pending_registration?

    @course_results = if params[:filter].present?
      params[:filter].strip!
      Course.where("course_name = ? OR course_code = ?", params[:filter], params[:filter])
    else
      Course.all
    end
  end
end
