class Articulo < ActiveRecord::Base
  extend FriendlyId
  friendly_id :titulo, use: [:slugged, :history]
  
  mount_uploader :imagen_url, ImageUploader
  
  validates_presence_of :titulo, :autor, :especialidad, :contenido, :imagen_url
  
  TIPO_DOCUMENTOS = [
    [ "articulo",   "articulo" ],
    [ "noticia",    "noticia" ]
  ]
end
