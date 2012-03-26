class ApplicationController < ActionController::Base
  protect_from_forgery
  after_filter :set_xhr_flash

  def set_xhr_flash
    flash.discard if request.xhr?
  end
  
  def authenticate
    unless session[:terapeuta]
      redirect_to root_url
      return false
    end
  end
  
  def encrypt_url(url)
    cipher = Gibberish::AES.new("lOl!123?")
    enc_url = cipher.enc(url.to_s)
    return Base64.urlsafe_encode64(enc_url)
  end
  
  def decrypt_url(url)
    cipher = Gibberish::AES.new("lOl!123?")
    dec_url = Base64.urlsafe_decode64(url)
    return cipher.dec(dec_url) 
  end
end
