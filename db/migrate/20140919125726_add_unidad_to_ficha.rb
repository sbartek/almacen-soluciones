class AddUnidadToFicha < ActiveRecord::Migration
  def change
    add_column :fichas, :unidad, :string
  end
end
