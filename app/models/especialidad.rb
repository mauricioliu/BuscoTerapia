class Especialidad < ActiveRecord::Base
  belongs_to :terapeuta
  
  validates :valor,
            :uniqueness => {:scope => :terapeuta_id }
end
