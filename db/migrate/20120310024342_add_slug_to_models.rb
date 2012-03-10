class AddSlugToModels < ActiveRecord::Migration
  def change
    add_column :terapias, :slug, :string
    add_index :terapias, :slug
    
    add_column :terapeutas, :slug, :string
    add_index :terapeutas, :slug
    
    add_column :articulos, :slug, :string
    add_index :articulos, :slug
  end
end
