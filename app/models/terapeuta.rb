# encoding: utf-8

require 'bcrypt'

class Terapeuta < ActiveRecord::Base
  extend FriendlyId
  friendly_id :nombre, use: [:slugged, :history]
  
  include BCrypt
  mount_uploader :imagen_url, PerfilUploader
  
  geocoded_by :direccion_completa
  after_validation :geocode
  
  has_many :tipo_terapias, :dependent => :destroy
  has_many :especialidades, :dependent => :destroy
  has_many :estudios, :dependent => :destroy
  has_many :forma_pagos, :dependent => :destroy
  has_many :pagos, :dependent => :destroy
  has_many :convenios, :dependent => :destroy

  accepts_nested_attributes_for :tipo_terapias, :allow_destroy => true, :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }, :allow_destroy => true
  accepts_nested_attributes_for :especialidades, :allow_destroy => true, :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }, :allow_destroy => true
  accepts_nested_attributes_for :estudios, :allow_destroy => true, :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }, :allow_destroy => true
  accepts_nested_attributes_for :forma_pagos, :allow_destroy => true, :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }, :allow_destroy => true
  accepts_nested_attributes_for :convenios, :allow_destroy => true, :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }, :allow_destroy => true
  
  #accepts_nested_attributes_for :tipo_terapias, :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }, :allow_destroy => true
  
  # validates :email, presence: true, uniqueness: true
  validates_associated :especialidades, :estudios
  
  validates_presence_of :nombre, :direccion, :region, :comuna, :telefono, :movil, :rut
  validates_numericality_of :telefono, :if => :telefono?
  validates_numericality_of :movil, :if => :movil?
  validates :email,   
            :presence => true,
            :uniqueness => true,
            :format => { :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i }

  validate :especialidades_no_duplicate, :especialidades_size, :tipo_terapias_size
  validates_format_of :rut, :with => /^0*(\d{1,3}(\.?\d{3})*)\-?([\dkK])$/i, :if => :rut?
  
  # attr_accessible :especialidades_attributes
  # attr_accessible :email_recovery
  
  attr_unsearchable :email, :password_hash, :created_at, :updated_at, :last_logged_in, :telefono, :movil, :direccion
  #before_create { generate_token(:auth_token) }
  # nombre, direccion, region, comuna, ptelefono, telefono, pmovil, movil, email, tipo, especialidad
  
  def direccion_completa
    if comuna != nil && region != nil
      direccion + ', ' + Comuna.find(comuna).nombre + ', ' + Region.find(region).nombre
    end
  end
  
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
  
  def especialidades_no_duplicate
    lista_esp = Array.new
    especialidades.each do |especialidad|
      lista_esp << especialidad.valor.strip
    end
    if lista_esp.uniq! != nil
      errors[:base] << "No pueden haber valores duplicados en especialidades"
    end
  end
  
  def especialidades_size
    lista_esp = Array.new
    especialidades.each do |especialidad|
      lista_esp << especialidad.valor.strip
    end
    if lista_esp.size == 0
      errors[:base] << "Debes ingresar al menos una especialidad"
    elsif lista_esp.size > 7
      errors[:base] << "Solo puedes ingresar un máximo de 7 especialidades"
    end
  end
  
  def tipo_terapias_size
    lista_tipos = Array.new
    tipo_terapias.each do |tipo_terapia|
      lista_tipos << tipo_terapia.nombre
    end
    if lista_tipos.size == 0
      errors[:base] << "Debes ingresar al menos un tipo de terapia"
    end
  end
end
