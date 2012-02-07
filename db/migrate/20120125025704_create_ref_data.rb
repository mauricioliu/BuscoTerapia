class CreateRefData < ActiveRecord::Migration
  def change
    create_table :ref_data do |t|
      t.string :nombre
      t.string :valor

      t.timestamps
    end
  end
end
