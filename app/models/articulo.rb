class Articulo < ActiveRecord::Base
  mount_uploader :imagen_url, ImageUploader
  
  TIPO_DOCUMENTOS = [
    [ "articulo",   "articulo" ],
    [ "noticia",    "noticia" ]
  ]
end
