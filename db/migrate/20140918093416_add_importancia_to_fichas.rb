class AddImportanciaToFichas < ActiveRecord::Migration
  def change
    add_column :fichas, :importancia, :string
  end
end
