class CreateArticulos < ActiveRecord::Migration
  def change
    create_table :articulos do |t|
      t.string :titulo
      t.string :autor
      t.string :especialidad
      t.text :contenido, :limit => 4294967295
      t.string :imagen_url

      t.timestamps
    end
  end
end
