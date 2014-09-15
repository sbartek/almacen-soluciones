require 'csv'
desc "Imports a CSV file into an ActiveRecord table"
task :import_almacen_csv, [:filename] => :environment do
  CSV.foreach('db/STOCKSAEMA2014V3PRUEBA.csv', :headers => true) do |row|
    ubi_hash = ubicacion_from_csv(row)
    ubi = Ubicacion.find_by codigo: ubi_hash[:codigo]
    if not ubi
      Ubicacion.create!(ubi_hash)
    end
    ficha_hash = ficha_from_cvs(row)
    ficha = Ficha.find_by codigo: ficha_hash[:codigo]
    if not ficha
      Ficha.create!(ficha_hash)
    end
    mat_hash = material_from_cvs(row)
    mat = find_material_in_db(mat_hash)
    if not mat
      material = Material.new
      material.ubicacion = mat_hash[:ubicacion]
      material.ficha = mat_hash[:ficha]
      material[:cantidad] = mat_hash[:cantidad]
      material.save
    end
  end
end

def ubicacion_from_csv(row)
  {codigo: row[0], nombre: row[1], ciudad: row[2]}
end

def ficha_from_cvs(row)
  {nombre: row[9], codigo: row[8]}
end

def material_from_cvs(row)
  ubi = Ubicacion.find_by codigo: row[0]
  ficha = Ficha.find_by codigo: row[8]
  {ubicacion: ubi, ficha: ficha, cantidad:row[25]}
end

def find_material_in_db(mat_hash)
  mat_hash[:ficha].materials.each do |mat|
    if mat.ubicacion == mat_hash[:ubicacion]
      return mat
    end
  end
  return nil
end
