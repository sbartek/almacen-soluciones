class CreateJoinTableFichasSubfamilias < ActiveRecord::Migration
  def change
    create_join_table :fichas, :subfamilias do |t|
      # t.index [:ficha_id, :subfamilia_id]
      # t.index [:subfamilia_id, :ficha_id]
    end
  end
end
