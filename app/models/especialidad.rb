class Especialidad < ActiveRecord::Base
  belongs_to :terapeuta
  
  validates :valor,
            :presence => true,
            :uniqueness => {:scope => :terapeuta_id }
end
