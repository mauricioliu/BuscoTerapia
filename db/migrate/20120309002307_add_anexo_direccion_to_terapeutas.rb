class AddAnexoDireccionToTerapeutas < ActiveRecord::Migration
  def change
    add_column :terapeutas, :anexo_direccion, :string
  end
end
