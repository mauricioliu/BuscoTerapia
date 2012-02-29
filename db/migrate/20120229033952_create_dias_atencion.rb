class CreateDiasAtencion < ActiveRecord::Migration
  def change
    create_table :dias_atencion do |t|
      t.integer :asesoria_id
      t.string :dia

      t.timestamps
    end
  end
end
