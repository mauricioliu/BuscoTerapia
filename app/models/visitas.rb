class Visitas < ActiveRecord::Base
  belongs_to :terapeuta
  
  def self.total_on(date, terapeuta_id)
    where("date(created_at) = ? and terapeuta_id = ?", date, terapeuta_id).sum(:cantidad)
  end
end
