class CreateTerapeuta < ActiveRecord::Migration
  def change
    create_table :terapeuta do |t|
      t.string :nombre
      t.string :direccion
      t.string :region
      t.string :comuna
      t.integer :ptelefono
      t.integer :telefono
      t.integer :pmovil
      t.integer :movil
      t.string :email
      t.string :tipo
      t.string :especialidad
      t.string :password_hash
      t.string :plan
      t.datetime :last_logged_in
      t.string :reset

      t.timestamps
    end
  end
end
