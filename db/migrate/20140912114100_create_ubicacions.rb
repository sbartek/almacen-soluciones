class CreateUbicacions < ActiveRecord::Migration
  def change
    create_table :ubicacions do |t|
      t.string :codigo
      t.string :nombre
      t.string :ciudad

      t.timestamps
    end
  end
end
