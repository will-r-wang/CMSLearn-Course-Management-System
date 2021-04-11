class PagesController < ApplicationController
  def home
    if current_user.type == "Admin"
      @user_registrations = UserRegistration.where(status: "pending") 
      @course_registrations = CourseRegistration.includes(:user, :course).where(status: "pending")
      @chart_data = ChartDataGet.new(
        CourseRegistration.where('grade is NOT NULL').pluck(:user_id, :grade)
      ).formatted_data
      @semester_timelines = Semester.all.map { |semester| [semester.name, semester.start_date.strftime("%Y-%B-%d"), semester.end_date.strftime("%Y-%B-%d")] }
    end
    @courses_teaching = Course.includes(:semester).where(teacher_id: current_user.id) if current_user.type == "Teacher"
    @user_registration = UserRegistration.find_by(user_id: current_user.id, status: "pending")

    @course_results = if params[:filter].present?
      params[:filter].strip!
      Course.includes(:teacher, :semester).where("course_name = ? OR course_code = ?", params[:filter], params[:filter])
    end
  end
end
