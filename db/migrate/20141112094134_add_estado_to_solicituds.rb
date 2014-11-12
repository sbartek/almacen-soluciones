class AddEstadoToSolicituds < ActiveRecord::Migration
  def change
    add_column :solicituds, :estado, :string, :limit => 2
  end
end
