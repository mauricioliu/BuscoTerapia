class CreateTerapiaTerapeutas < ActiveRecord::Migration
  def change
    create_table :terapia_terapeutas do |t|
      t.integer :terapia_id
      t.integer :terapeuta_id
      t.string :show
      
      t.timestamps
    end
  end
end
