class AddMostrarPaginaPrincipal < ActiveRecord::Migration
  def up
    add_column :articulos, :ocultar, :string, :default => '0'
  end
  
  def down
    add_column :articulos, :ocultar, :string
  end
end
