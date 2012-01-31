class Terapia < ActiveRecord::Base
  mount_uploader :imagen_url, ImageUploader
end
