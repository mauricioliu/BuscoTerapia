# encoding: utf-8

class Asesorium < ActiveRecord::Base
  
  has_many :dias_atencion, :dependent => :destroy
  
  accepts_nested_attributes_for :dias_atencion, :allow_destroy => true, :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }, :allow_destroy => true
  
  attr_writer :current_step
  
  #validates_presence_of :necesidad, :if => lambda { |o| o.current_step == "necesidades" }
  validates_presence_of :necesidad_1, :if => lambda { |o| o.current_step == "miproblema" }
  validates_presence_of :paciente_nombre, :terapia_para, :paciente_telefono, :if => lambda { |o| o.current_step == "misdatos" }
  validates :paciente_email,   
            :presence => true,   
            :format => { :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i },
            :if => lambda { |o| o.current_step == "misdatos" }
  validates_numericality_of :paciente_edad, :if => lambda { |o| o.current_step == "misdatos" }
  
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
