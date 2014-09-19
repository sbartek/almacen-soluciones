class AddDdpSaemaToFicha < ActiveRecord::Migration
  def change
    add_column :fichas, :ddp_saema, :decimal, precision: 9, scale: 2
  end
end
