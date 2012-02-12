class CreateTerapeutas < ActiveRecord::Migration
  def change
    create_table :terapeutas do |t|
      t.string :nombre
      t.string :rut
      t.string :direccion
      t.string :region
      t.string :comuna
      t.string :codigo_postal
      t.string :sitio_web
      t.integer :ptelefono
      t.integer :telefono
      t.integer :movil
      t.string :email
      
      t.string :enfoque_terapeutico
      t.string :especialidad
      t.text :estudios
      t.text :perfeccionamiento
      t.string :descuentos
      t.string :password_hash
      t.string :plan
      t.datetime :plan_expira
      t.datetime :last_logged_in
      t.string :reset

      t.timestamps
    end
  end
end
