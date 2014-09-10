class CreateFichas < ActiveRecord::Migration
  def change
    create_table :fichas do |t|
      t.string :nombre
      t.string :codigo

      t.timestamps
    end
  end
end
