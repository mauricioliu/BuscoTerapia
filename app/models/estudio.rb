class Estudio < ActiveRecord::Base
  belongs_to :terapeuta
  
  validates_presence_of :titulo, :establecimiento
end
