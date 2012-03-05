class HomeController < ApplicationController
  http_basic_authenticate_with :name => "btp", :password => "btp.123!"
  
  def index
    @search = Terapeuta.search(params[:search])
    @terapeutas = @search.all
  end
  
  def preguntas_frecuentes
    
  end
end
