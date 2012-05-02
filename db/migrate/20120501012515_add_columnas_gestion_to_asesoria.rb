class AddColumnasGestionToAsesoria < ActiveRecord::Migration
  def up
    add_column :asesorias, :terapeuta_id, :integer
    add_column :asesorias, :comentarios, :text, :limit => 65535
  end
  
  def down
    remove_column :asesorias, :terapeuta_id
    remove_column :asesorias, :comentarios
  end
end
