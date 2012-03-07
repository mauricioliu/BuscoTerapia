class Articulo < ActiveRecord::Base
  mount_uploader :imagen_url, ImageUploader
  
  validates_presence_of :titulo, :autor, :especialidad, :contenido, :imagen_url
  
  TIPO_DOCUMENTOS = [
    [ "articulo",   "articulo" ],
    [ "noticia",    "noticia" ]
  ]
end
