class Terapia < ActiveRecord::Base
  mount_uploader :imagen_url, ImageUploader
  
  validates_presence_of :imagen_url, :nombre_corto, :descripcion_corta, :descripcion, :categoria, :caracteristica
end
