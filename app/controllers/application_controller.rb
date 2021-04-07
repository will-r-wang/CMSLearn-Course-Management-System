class ApplicationController < ActionController::Base
  before_action :authorized
  helper_method :current_user
  helper_method :current_semester
  helper_method :account_type
  helper_method :pending_user_registration?
  helper_method :pending_course_registration?
  helper_method :registered?
  helper_method :logged_in?
  helper_method :admin?
  helper_method :student?
  helper_method :teacher?
  helper_method :current_user_full_name

  def current_user
    User.find_by(id: session[:user_id])
  end

  def current_semester
    Semester.where("start_date <= ?", Time.now).where("end_date >= ?", Time.now).first
  end

  def account_type
    admin? ? "Admin" : (student? ? "Student" : (teacher? ? "Teacher" : "User"))
  end

  def pending_user_registration?
    logged_in? && !UserRegistration.where(user_id: current_user.id, status: "pending").empty?
  end

  def pending_course_registration?
    logged_in? && !CourseRegistration.where(user_id: current_user.id, status: "pending").empty?
  end

  def registered?
    logged_in? && !CourseRegistration.where(user_id: current_user.id, status: "approved").empty?
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

  def current_user_full_name
    current_user.full_name
  end

  def authorized
    unless logged_in?
      flash[:error] = "Please login to continue."
      redirect_to '/login'
    end
  end
end
