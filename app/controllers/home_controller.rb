class HomeController < ApplicationController
  def index
    @search = Terapeuta.search(params[:search])
    @terapeutas = @search.all
  end
  
  def preguntas_frecuentes
    
  end
end
