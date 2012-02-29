class CreateDiasAtencion < ActiveRecord::Migration
  def change
    create_table :dias_atencion do |t|
      t.integer :asesorium_id
      t.string :dia

      t.timestamps
    end
  end
end
