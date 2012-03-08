class ChangeAsesoriaHoraColumnType < ActiveRecord::Migration
  def up
    change_column :asesorias, :hora_desde, :string
    change_column :asesorias, :hora_hasta, :string
  end

  def down
    change_column :asesorias, :hora_desde, :datetime
    change_column :asesorias, :hora_hasta, :string
  end
end
