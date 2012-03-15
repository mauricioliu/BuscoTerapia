class Especialidad < ActiveRecord::Base
  belongs_to :terapeuta
  
  validates_presence_of :valor
  validates :valor,
            :uniqueness => {:scope => :terapeuta_id }
end
