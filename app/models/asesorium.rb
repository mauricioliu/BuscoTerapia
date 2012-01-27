class Asesorium < ActiveRecord::Base
  attr_writer :current_step
  
  #validates_presence_of :necesidad, :if => lambda { |o| o.current_step == "necesidades" }
  validates_presence_of :paciente_nombres, :if => lambda { |o| o.current_step == "misdatos" }
  
  def current_step
    @current_step || steps.first
  end
  
  def steps
    #%w[misdatos necesidades comprobante]
    %w[miproblema misdatos]
  end
  
  def next_step
    self.current_step = steps[steps.index(current_step)+1]
  end
  
  def previous_step
    self.current_step = steps[steps.index(current_step)-1]
  end
  
  def first_step?
    current_step == steps.first
  end
  
  def last_step?
    current_step == steps.last
  end
end
