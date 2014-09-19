class AddProyectoIdToMaterial < ActiveRecord::Migration
  def change
    add_column :materials, :proyecto_id, :integer
  end
end
