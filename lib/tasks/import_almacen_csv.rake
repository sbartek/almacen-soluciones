require 'csv'
desc "Imports a CSV file into an ActiveRecord table"
task :import_almacen_csv, [:filename] => :environment do
  CSV.foreach('db/STOCKSAEMA2014V3PRUEBA.csv', :headers => true) do |row|
    ubi_hash = ubicacion_from_csv(row)
    ubi = Ubicacion.find_by codigo: ubi_hash[:codigo]
    if not ubi
      Ubicacion.create!(ubi_hash)
    end
  end
end

def ubicacion_from_csv(row)
  {codigo: row[0], nombre: row[1], ciudad: row[2]}
end
