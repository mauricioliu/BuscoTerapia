class HomeController < ApplicationController
  before_filter :set_title
  layout :resolve_layout 
  
  def index
    @search = Terapeuta.search(params[:search])
    @terapeutas = @search.all
    @articulos = Articulo.where("tipo = 'articulo' and mostrar_carrusel='1'").order("created_at desc") 
  end
  
  def preguntas_frecuentes
    
  end
  
  def politicas_de_uso
    
  end
  
  def privacidad
    
  end
  
  def contacto
    if params[:nombre]
      nombre = params[:nombre]
      email = params[:email]
      mensaje = params[:mensaje]
      TerapeutaMailer.contacto(nombre,email,mensaje).deliver
      
      redirect_to root_url
    end
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

  def set_title
    @menu = "inicio"
  end
end
