class CoursesController < ApplicationController
  skip_before_action :authorized
  before_action :set_course, only: %i[ show edit update destroy ]

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
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

  def edit

  end

  def update
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

  def course_params
    params.require(:course).permit(:course_name, :course_code, :capacity)
  end
end
