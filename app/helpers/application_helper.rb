module ApplicationHelper
  def current_user
    User.find_by(id: session[:user_id])
  end

  def current_semester
    Semester.where("start_date <= ?", Time.now).where("end_date >= ?", Time.now).first
  end

  def pending_user_registration?
    logged_in? && !UserRegistration.where(user_id: current_user.id, status: "pending").empty?
  end

  def logged_in?
    !current_user.nil?
  end

  def admin?
    logged_in? && !Admin.find_by(username: current_user.username).nil?
  end

  def student?
    logged_in? && !Student.find_by(username: current_user.username).nil?
  end

  def teacher?
    logged_in? && !Teacher.find_by(username: current_user.username).nil?
  end
end
