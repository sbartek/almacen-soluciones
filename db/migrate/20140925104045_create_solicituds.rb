class CreateSolicituds < ActiveRecord::Migration
  def change
    create_table :solicituds do |t|
      t.date :fecha
      t.belongs_to :proyecto, index: true
      t.belongs_to :usuario, index: true
      t.text :descripcion
      t.string :prioridad
      t.date :fecha_limite
      t.text :notas
      t.string :categoria

      t.timestamps
    end
  end
end
