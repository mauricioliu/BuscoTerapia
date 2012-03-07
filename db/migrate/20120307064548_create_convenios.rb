class CreateConvenios < ActiveRecord::Migration
  def change
    create_table :convenios do |t|
      t.integer :terapeuta_id
      t.string :valor

      t.timestamps
    end
  end
end
