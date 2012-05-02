class AddStatusToAsesorias < ActiveRecord::Migration
  def up
     add_column :asesorias, :status, :string, :default => 'nuevo'
  end
  
  def down
    remove_column :asesorias, :status
  end
end
