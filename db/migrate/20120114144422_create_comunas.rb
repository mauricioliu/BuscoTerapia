class CreateComunas < ActiveRecord::Migration
  def change
    create_table :comunas do |t|
      t.integer :region_id
      t.string :nombre

      t.timestamps
    end
  end
end
