class CreateAsesoriaH < ActiveRecord::Migration
  def change
    create_table :asesoria_h do |t|
      t.integer :asesoria_id
      t.string :status
      t.string :status
      t.text :comentarios, :limit => 65535

      t.timestamps
    end
  end
end
