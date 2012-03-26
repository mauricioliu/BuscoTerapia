class CreateEventSeries < ActiveRecord::Migration
  def change
    create_table :event_series do |t|
      t.integer :terapeuta_id
      t.integer :frequency
      t.string :period, :default => 'monthly'
      t.datetime :starts_at
      t.datetime :ends_at

      t.timestamps
    end
  end
end
