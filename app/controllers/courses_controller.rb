class CoursesController < ApplicationController
  skip_before_action :authorized
  before_action :set_session_course, :set_course, only: %i[ show edit update destroy register withdraw ]

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params.except(:announcement_content))
    @course.teacher = current_user
    @course.semester = current_semester

    if @course.save
      flash[:notice] = "Course successfully created."
      redirect_to root_path
    else
      flash[:error] = @course.errors
      redirect_to new_course_path
    end
  end

  def show
    if current_user.type == "Student"
      course_registration = CourseRegistration.find_by!(status: "approved", user: current_user, course: @course)
      @grade = course_registration.grade
    end
  end

  def update_grade
    course_registration = CourseRegistration.find_by!(status: "approved", user: Student.find_by!(username: params[:username]))
    course_registration.update!(grade: params[:updated_grade])

    flash[:notice] = "Student with username=#{params[:username]} grade succesfully updated"
    redirect_back fallback_location: root_path
  end

  def register
    create_course_registration
  rescue
    flash[:error] = "Error creating course registration"
    redirect_to root_path
  else
    flash[:notice] = "Course #{@course.course_code} successfully registered. An admin will review your request shortly."
    redirect_to root_path
  end

  def withdraw
    course_registration = CourseRegistration.find_by!(status: "approved", user: current_user, course: @course)

    if course_registration
      course_registration.update!(status: "withdrawn")
      flash[:notice] = "Course #{@course.course_code} successfully withdrawn."
      redirect_to root_path
    end
  end

  def create_announcement
    course = Course.find(session[:course_id])
    announcement_manager = AnnouncementManager.find(session[:course_id])
    announcement = announcement_manager.announcements.build(announcement_content: params[:announcement_content])
    announcement.save
    announcement = Announcement.last
    course.announcement_manager.notify(announcement)
    flash[:notice] = "Announcement successfully created."
    redirect_to course_path(course)
  end

  def update
    if @course.update(course_params)
      flash[:notice] = "Course successfully updated."
      redirect_to course_path(@course)
    else
      flash[:notice] = @course.errors
      redirect_to edit_course_path(@course)
    end
  end

  def destroy
    @course.destroy
    flash[:notice] = "Course successfully deleted."
    redirect_to root_path
  end

  private
  def set_course
    @course = Course.find(params[:id])
  end

  def set_session_course
    session[:course_id] = params[:id]
  end

  def course_params
    params.require(:course).permit(:course_name, :course_code, :capacity, :announcement_content)
  end

  def create_course_registration
    CourseRegistration.create!(status: "pending", user: current_user, course: @course)
  end
end
