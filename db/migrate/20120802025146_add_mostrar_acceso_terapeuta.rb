class AddMostrarAccesoTerapeuta < ActiveRecord::Migration
  def up
    add_column :articulos, :mostrar_acceso_terapeuta, :string, :default => '0'
  end
  
  def down
    add_column :articulos, :mostrar_acceso_terapeuta, :string
  end
end
