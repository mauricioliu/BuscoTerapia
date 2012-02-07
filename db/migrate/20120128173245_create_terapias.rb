class CreateTerapias < ActiveRecord::Migration
  def change
    create_table :terapias do |t|
      t.string :nombre_corto
      t.string :descripcion_corta
      t.string :descripcion
      t.string :categoria
      t.string :caracteristica
      t.string :imagen_url

      t.timestamps
    end
  end
end
