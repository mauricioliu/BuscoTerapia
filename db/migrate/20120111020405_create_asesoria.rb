class CreateAsesoria < ActiveRecord::Migration
  def change
    create_table :asesoria do |t|
      t.string :necesidad_1
      t.string :necesidad_2
      
      t.string :paciente_nombre
      t.integer :paciente_edad
      t.string :terapia_para
      t.string :terapia_tipo
      
      t.string :paciente_telefono
      t.string :paciente_email
      t.string :paciente_region
      t.string :paciente_comuna
      
      t.string :dia_preferencia
      t.datetime :fecha_desde_est
      t.datetime :fecha_hasta_est
      t.string :rango_horario
      
      t.string :terapeuta_sexo
      t.string :terapeuta_otro
      t.timestamps
    end
  end
end
