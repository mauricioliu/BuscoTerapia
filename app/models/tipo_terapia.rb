class TipoTerapia < ActiveRecord::Base
  belongs_to :terapeuta, :through => :ref_data
end
