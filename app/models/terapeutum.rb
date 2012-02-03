require 'bcrypt'

class Terapeutum < ActiveRecord::Base
  include BCrypt
  # validates :email, presence: true, uniqueness: true
  validates_presence_of :nombre, :direccion, :region, :comuna, :ptelefono, :telefono, :pmovil, :movil, :tipo, :especialidad
  validates_numericality_of :ptelefono, :telefono, :pmovil, :movil
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
    end while Terapeutum.exists?(column => self[column])
  end
end
