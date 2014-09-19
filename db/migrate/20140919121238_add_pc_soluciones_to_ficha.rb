class AddPcSolucionesToFicha < ActiveRecord::Migration
  def change
    add_column :fichas, :pc_soluciones, :decimal, precision: 9, scale: 2
  end
end
