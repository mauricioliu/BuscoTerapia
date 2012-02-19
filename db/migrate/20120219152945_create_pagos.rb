class CreatePagos < ActiveRecord::Migration
  def change
    create_table :pagos do |t|
      t.integer :terapeuta_id
      t.string :tipo
      t.integer :monto
      t.string :estado
      t.datetime :fecha_pago

      t.timestamps
    end
  end
end
