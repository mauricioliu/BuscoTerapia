class AddPrecioToAsesorias < ActiveRecord::Migration
  def change
    add_column :asesorias, :precio_max, :string
  end
end
