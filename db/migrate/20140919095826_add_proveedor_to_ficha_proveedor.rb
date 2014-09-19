class AddProveedorToFichaProveedor < ActiveRecord::Migration
  def change
    add_reference :ficha_proveedors, :proveedor, index: true
  end
end
