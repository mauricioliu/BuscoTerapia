require 'bcrypt'

class Terapeuta < ActiveRecord::Base
  include BCrypt
  
  has_many :tipo_terapias
  has_many :especialidades

  accepts_nested_attributes_for :tipo_terapias
  accepts_nested_attributes_for :especialidades
  
  #accepts_nested_attributes_for :tipo_terapias, :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }, :allow_destroy => true
  
  # validates :email, presence: true, uniqueness: true
  validates_presence_of :nombre, :direccion, :region, :comuna, :ptelefono, :telefono, :movil
  validates_numericality_of :ptelefono, :telefono, :movil
  validates :email,   
            :presence => true,   
            :format => { :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i }
  
  # attr_accessible :password_confirmation
  # attr_accessible :email_recovery
  
  attr_unsearchable :email, :password_hash, :plan, :created_at, :updated_at, :last_logged_in, :telefono, :movil, :direccion
  #before_create { generate_token(:auth_token) }
  # nombre, direccion, region, comuna, ptelefono, telefono, pmovil, movil, email, tipo, especialidad
  
  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
  
  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while Terapeuta.exists?(column => self[column])
  end
end
