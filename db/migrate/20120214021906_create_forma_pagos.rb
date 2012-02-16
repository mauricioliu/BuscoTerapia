class CreateFormaPagos < ActiveRecord::Migration
  def change
    create_table :forma_pagos do |t|
      t.integer :terapeuta_id
      t.string :valor

      t.timestamps
    end
  end
end
