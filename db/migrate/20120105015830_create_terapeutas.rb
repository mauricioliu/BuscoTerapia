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
      
      t.string :plan_tipo
      t.datetime :plan_expira
      t.string :plan_ciclo

      t.string :arancel
      t.string :descuentos
      t.string :convenios
      
      t.string :password_hash
      t.datetime :last_logged_in
      t.string :reset
      
      t.string :estado

      t.timestamps
    end
  end
end
