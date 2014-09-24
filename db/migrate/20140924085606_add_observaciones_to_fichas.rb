class AddObservacionesToFichas < ActiveRecord::Migration
  def change
    add_column :fichas, :observaciones, :text
  end
end
