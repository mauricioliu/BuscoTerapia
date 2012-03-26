class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :event_series_id
      t.integer :terapeuta_id
      t.string :title
      t.datetime :starts_at
      t.datetime :ends_at

      t.timestamps
    end
  end
end
