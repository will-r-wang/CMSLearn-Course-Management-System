class ApplicationController < ActionController::Base
  before_action :authorized

  include ApplicationHelper

  def authorized
    unless logged_in?
      flash[:error] = "Please login to continue."
      redirect_to '/login'
    end
  end
end
