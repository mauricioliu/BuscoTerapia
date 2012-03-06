class AddImagenUrlToTerapeuta < ActiveRecord::Migration
  def change
    add_column :terapeutas, :imagen_url, :string
  end
end
