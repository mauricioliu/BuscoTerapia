class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def authenticate
    unless session[:terapeuta]
      redirect_to root_url
      return false
    end
  end
end
