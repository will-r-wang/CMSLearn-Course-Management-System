class ApplicationController < ActionController::Base
  before_action :authorized
  helper_method :current_user
  helper_method :account_type
  helper_method :logged_in?
  helper_method :admin?
  helper_method :student?
  helper_method :teacher?
  helper_method :current_user_full_name

  def current_user
    User.find_by(id: session[:user_id])
  end

  def account_type
    admin? ? "Admin" : (student? ? "Student" : (teacher? ? "Teacher" : "User"))
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
