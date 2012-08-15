class CreateContactos < ActiveRecord::Migration
  def change
    create_table :contactos do |t|
      t.integer :terapeuta_id
      t.integer :cantidad

      t.timestamps
    end
  end
end
