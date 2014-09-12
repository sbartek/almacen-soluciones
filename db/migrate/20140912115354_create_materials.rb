class CreateMaterials < ActiveRecord::Migration
  def change
    create_table :materials do |t|
      t.integer :cantidad
      t.belongs_to :ficha, index: true
      t.belongs_to :ubicacion, index: true

      t.timestamps
    end
  end
end
