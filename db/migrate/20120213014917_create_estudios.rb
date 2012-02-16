class CreateEstudios < ActiveRecord::Migration
  def change
    create_table :estudios do |t|
      t.integer :terapeuta_id
      t.string :titulo
      t.string :establecimiento

      t.timestamps
    end
  end
end
