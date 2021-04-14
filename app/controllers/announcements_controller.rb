class AnnouncementsController < ApplicationController
  skip_before_action :authorized

  def new
    @announcement = Announcement.new
  end

  def create
    @announcement = Announcement.new(announcement_params)

    if @announcement.save
      flash[:notice] = "Announcement successfully created."
      redirect_to course_path(session[:course_id])
    else
      flash[:error] = @announcement.errors
      redirect_to course_path(session[:course_id])
    end
  end

  def update
    if @announcement.update(announcement_params)
      flash[:notice] = "Announcement was successfully updated."
      redirect_to course_path(session[:course_id])
    else
      flash[:error] = @announcement.errors
      redirect_to course_path(session[:course_id])
    end
  end

  def destroy
    @announcement.destroy
    flash[:notice] = "#{klass.name} was successfully destroyed."
    redirect_to course_path(session[:course_id])
  end

  private
  def set_announcement
    @announcement = Announcement.find(params[:id])
  end

  def announcement_params
    params.require(:announcement).permit(:announcement_content)
  end
end
