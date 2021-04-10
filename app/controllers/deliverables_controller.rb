class DeliverablesController < ApplicationController
  before_action :set_deliverable, only: %i[ show edit update destroy ]
  before_action :sanitize_params, only: %i[ edit update ]

  def new
    @deliverable = klass.new
  end

  def create
    arguments = deliverable_params.except(:deliverable_type).to_h.symbolize_keys
    arguments[:course_id] = session[:course_id]
    @deliverable = DeliverableFactory.new.create_activity(deliverable_params[:deliverable_type], arguments)

    if @deliverable.save
      flash[:notice] = "#{deliverable_params[:deliverable_type]} successfully created."
      redirect_to course_path(session[:course_id])
    else
      flash[:error] = @deliverable.errors
      redirect_to course_path(session[:course_id])
    end
  end

  def update
    if @deliverable.update(deliverable_params)
      flash[:notice] = "#{klass.name} was successfully updated."
      redirect_to course_path(session[:course_id])
    else
      flash[:error] = @deliverable.errors
      redirect_to course_path(session[:course_id])
    end
  end

  def destroy
    @deliverable.destroy
    flash[:notice] = "#{klass.name} was successfully destroyed."
    redirect_to course_path(session[:course_id])
  end

  private
  def set_deliverable
    @deliverable = klass.find(params[:id])
  end

  def sanitize_params
    if params.has_key? :quiz
      params[:deliverable] = params.delete :quiz
    elsif params.has_key? :assignment
      params[:deliverable] = params.delete :assignment
    elsif params.has_key? :tutorial
      params[:deliverable] = params.delete :tutorial
    end
  end

  def klass
    Object.const_get params[:controller].classify
  end

  def deliverable_params
    params.require(klass.name.underscore.to_sym).permit(:title, :instructions, :weight, :deliverable_type)
  end
end
