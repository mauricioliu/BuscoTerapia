class CreateVisitas < ActiveRecord::Migration
  def change
    create_table :visitas do |t|
      t.integer :terapeuta_id
      t.integer :cantidad

      t.timestamps
    end
  end
end
