class HomeController < ApplicationController
  layout :resolve_layout 
  http_basic_authenticate_with :name => "btp", :password => "btp.123!"
  
  def index
    @search = Terapeuta.search(params[:search])
    @terapeutas = @search.all
    @articulos = Articulo.where("tipo = 'articulo'").order("created_at desc") 
  end
  
  def preguntas_frecuentes
    
  end
  
  def politicas_de_uso
    
  end
  
  def privacidad
    
  end

private 
  def resolve_layout
    case action_name
    when "condiciones_de_uso","privacidad"
      "informativo"
    else
      "application"
    end
  end
end
