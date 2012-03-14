class TerapiaTerapeuta < ActiveRecord::Base
  belongs_to :terapeuta
  belongs_to :terapia
end
