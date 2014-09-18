require 'csv'
desc "Imports a CSV file into an ActiveRecord table"
task :import_almacen_csv, [:filename] => :environment do
  CSV.foreach('db/STOCKSAEMA2014V3PRUEBA.csv', :headers => true) do |row|
    unidad_hash = negocio_unidad_from_csv(row)
    unidad = NegocioUnidad.find_by(unidad_hash)
    if not unidad
      NegocioUnidad.create!(unidad_hash)
    end

    familia_hash = familia_from_csv(row)
    familia = Familia.find_by(familia_hash)
    if not familia
      Familia.create!(familia_hash)
    end

    subfamilia_hash = subfamilia_from_csv(row)
    subfamilia = Subfamilia.find_by(subfamilia_hash)
    if not subfamilia
      Subfamilia.create!(subfamilia_hash)
    end

    ubi_hash = ubicacion_from_csv(row)
    ubi = Ubicacion.find_by codigo: ubi_hash[:codigo]
    if not ubi
      Ubicacion.create!(ubi_hash)
    end

    create_ficha_from_csv(row)

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

def negocio_unidad_from_csv(row)
  {nombre: row[4]}
end

def familia_from_csv(row)
  unidad = NegocioUnidad.find_by(nombre: row[4])
  {nombre: row[5], negocio_unidad: unidad}
end

def subfamilia_from_csv(row)
  familia = Familia.find_by(nombre: row[5])
  {nombre: row[6], familia: familia}
end

def ubicacion_from_csv(row)
  {codigo: row[0], nombre: row[1], ciudad: row[2]}
end

def ficha_from_cvs(row)
  {nombre: row[9], codigo: row[8], importancia: row[7]}
end

def create_ficha_from_csv(row)
  ficha_hash = ficha_from_cvs(row)
  ficha = Ficha.find_by codigo: ficha_hash[:codigo]
  if not ficha
    ficha = Ficha.create!(ficha_hash)
    subfamilia = Subfamilia.find_by(nombre: row[6])
    ficha.subfamilias << subfamilia
  end
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
