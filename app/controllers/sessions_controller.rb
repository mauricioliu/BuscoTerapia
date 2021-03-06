# encoding: utf-8

class SessionsController < ApplicationController
  def new
  end
  
  def create
    terapeuta = Terapeuta.find_by_email(params[:email])
    if terapeuta && terapeuta.password == params[:password]
      #cookies.permanent[:auth_token] = terapeuta.auth_token
      session[:terapeuta] = terapeuta
      @enc_email = encrypt_url(terapeuta.email)
      if terapeuta.last_logged_in == nil || terapeuta.reset == 'y'
        render "terapeutas/change_password"
      else
        Terapeuta.update(terapeuta.id, { :last_logged_in => Time.now })
        redirect_to edit_terapeuta_path(terapeuta)
      end
    else
      #flash.now.alert = "Invalid email or password"
      redirect_to new_session_path, :notice => "Correo o contraseña equivocada"
    end
  end

  def destroy
    session[:terapeuta] = nil
    redirect_to root_url, :notice => "Logged out!"
  end
end
