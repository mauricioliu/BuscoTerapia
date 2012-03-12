class AddEnfoqueToTerapeuta < ActiveRecord::Migration
  def change
    add_column :terapeutas, :enfoque, :string
  end
end
