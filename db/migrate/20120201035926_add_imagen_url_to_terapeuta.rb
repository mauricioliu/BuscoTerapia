class AddImagenUrlToTerapeuta < ActiveRecord::Migration
  def change
    add_column :terapeuta, :imagen_url, :string
  end
end
