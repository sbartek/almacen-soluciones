class CreateFichaProveedors < ActiveRecord::Migration
  def change
    create_table :ficha_proveedors do |t|
      t.string :nombre
      t.string :codigo
      t.decimal :precio, precision: 9, scale: 2
      t.belongs_to :ficha, index: true

      t.timestamps
    end
  end
end
