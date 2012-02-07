# encoding: utf-8

class SessionsController < ApplicationController
  def new
  end
  
  def create
    terapeuta = Terapeutum.find_by_email(params[:email])
    if terapeuta && terapeuta.password == params[:password]
      #cookies.permanent[:auth_token] = terapeuta.auth_token
      session[:terapeuta] = terapeuta
      if terapeuta.last_logged_in == nil || terapeuta.reset == 'y'
        render "terapeuta/change_password"
      else
        terapeuta.last_logged_in = Time.now
        terapeuta.save!
        redirect_to root_url, :notice => "Logged in!"
      end
    else
      #flash.now.alert = "Invalid email or password"
      redirect_to root_url, :notice => "Invalid email or password"
    end
  end

  def destroy
    session[:terapeuta] = nil
    redirect_to root_url, :notice => "Logged out!"
  end
end
