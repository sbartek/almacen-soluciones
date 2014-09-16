class CreateFamilias < ActiveRecord::Migration
  def change
    create_table :familias do |t|
      t.string :nombre
      t.belongs_to :negocio_unidad, index: true

      t.timestamps
    end
  end
end
