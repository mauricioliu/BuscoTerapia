class CreateTipoTerapias < ActiveRecord::Migration
  def change
    create_table :tipo_terapias do |t|
      t.integer :terapeuta_id
      t.string :nombre

      t.timestamps
    end
  end
end
