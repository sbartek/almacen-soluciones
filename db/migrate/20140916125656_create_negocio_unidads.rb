class CreateNegocioUnidads < ActiveRecord::Migration
  def change
    create_table :negocio_unidads do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
