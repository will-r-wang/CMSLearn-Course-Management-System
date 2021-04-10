class ResourcesController < ApplicationController
  before_action :set_resource, only: %i[ show edit update destroy ]
  before_action :sanitize_params, only: %i[ edit update ]

  def new
    @resource = klass.new
  end

  def create
    arguments = resource_params.except(:resource_type).to_h.symbolize_keys
    arguments[:course_id] = session[:course_id]
    @resource = ResourceFactory.new.create_activity(resource_params[:resource_type], arguments)

    if @resource.save
      flash[:notice] = "#{resource_params[:resource_type]} successfully created."
      redirect_to course_path(session[:course_id])
    else
      flash[:error] = @resource.errors
      redirect_to course_path(session[:course_id])
    end
  end

  def update
    if @resource.update(resource_params)
      flash[:notice] = "#{klass.name} was successfully updated."
      redirect_to course_path(session[:course_id])
    else
      flash[:error] = @resource.errors
      redirect_to course_path(session[:course_id])
    end
  end

  def destroy
    @resource.destroy
    flash[:notice] = "#{klass.name} was successfully destroyed."
    redirect_to course_path(session[:course_id])
  end

  private
  def set_resource
    @resource = klass.find(params[:id])
  end

  def sanitize_params
    if params.has_key? :video
      params[:resource] = params.delete :video
    elsif params.has_key? :url
      params[:resource] = params.delete :url
    elsif params.has_key? :document
      params[:resource] = params.delete :document
    end
  end

  def klass
    Object.const_get params[:controller].classify
  end

  def resource_params
    params.require(klass.name.underscore.to_sym).permit(:title, :description, :hyperlink, :resource_type)
  end
end
