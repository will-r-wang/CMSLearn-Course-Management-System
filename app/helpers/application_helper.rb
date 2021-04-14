module ApplicationHelper
  def current_user
    User.find_by(id: session[:user_id])
  end

  def current_semester
    Semester.where("start_date <= ?", Time.now).where("end_date >= ?", Time.now).first || NullSemester.new
  end

  def logged_in?
    !current_user.nil?
  end
end
