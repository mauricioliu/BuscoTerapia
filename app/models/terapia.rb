class Terapia < ActiveRecord::Base
  extend FriendlyId
  friendly_id :nombre_corto, use: [:slugged, :history]
  
  has_many :terapia_terapeutas
  has_many :terapeutas, :through => :terapia_terapeutas
  
  accepts_nested_attributes_for :terapia_terapeutas, :allow_destroy => true
  
  mount_uploader :imagen_url, ImageUploader
  
  validates_presence_of :imagen_url, :nombre_corto, :descripcion_corta, :descripcion, :categoria, :caracteristica
end
