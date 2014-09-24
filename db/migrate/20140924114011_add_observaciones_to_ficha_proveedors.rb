class AddObservacionesToFichaProveedors < ActiveRecord::Migration
  def change
    add_column :ficha_proveedors, :observaciones, :text
  end
end
