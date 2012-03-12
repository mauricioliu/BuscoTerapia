class AddLugarPreferenciaToAsesoria < ActiveRecord::Migration
  def change
    add_column :asesorias, :lugar_preferencia, :string
  end
end
