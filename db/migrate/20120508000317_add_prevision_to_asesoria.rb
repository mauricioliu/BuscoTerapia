class AddPrevisionToAsesoria < ActiveRecord::Migration
  def up
    add_column :asesorias, :prevision, :string
    add_column :asesorias, :como_se_entero, :string
  end
  
  def down
    remove_column :asesorias, :prevision
    remove_column :asesorias, :como_se_entero
  end
end
