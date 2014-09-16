class CreateSubfamilias < ActiveRecord::Migration
  def change
    create_table :subfamilias do |t|
      t.string :nombre
      t.belongs_to :familia, index: true

      t.timestamps
    end
  end
end
