class CreateAsesorias < ActiveRecord::Migration
  def change
    create_table :asesorias do |t|
      t.text :necesidad_1, :limit => 65535
      t.text :necesidad_2, :limit => 65535
      
      t.string :paciente_nombre
      t.integer :paciente_edad
      t.string :terapia_para
      t.string :terapia_tipo
      
      t.string :paciente_telefono
      t.string :paciente_email
      
      t.string :hora_desde
      t.string :hora_hasta
      
      # t.string :terapeuta_sexo
      t.string :terapeuta_otro
      t.timestamps
    end
  end
end
