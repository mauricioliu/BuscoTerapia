class AddMostrarCarruselToArticulos < ActiveRecord::Migration
  def change
    add_column :articulos, :mostrar_carrusel, :string
  end
end
