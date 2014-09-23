require 'csv'
desc "Imports a CSV file into an ActiveRecord table"
task :import_almacen_csv, [:filename] => :environment do
  CSV.foreach('db/STOCKSAEMA2014V4PRUEBA.csv', :headers => true) do |row|
    create_proyecto_from_csv(row)
    
    create_proveedor_from_csv(row)

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

    create_ficha_from_csv(row)

    create_ficha_proveedor_from_csv(row)

    ubi_hash = ubicacion_from_csv(row)
    ubi = Ubicacion.find_by codigo: ubi_hash[:codigo]
    if not ubi
      Ubicacion.create!(ubi_hash)
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

def precio_reader(precio)
  num = /(?:\d+.)?\d*(?:,\d\d?)?/.match(precio)
  num_s = num.to_s
  num_s.gsub!(/\./,'')
  num_s.gsub!(/,/,'.')
  return num_s
end

def proyecto_from_csv(row)
  {nombre: row[3]}
end

def create_proyecto_from_csv(row)
  proyecto_hash = proyecto_from_csv(row)
  proyecto = Proyecto.find_by(proyecto_hash)
  if not proyecto
    Proyecto.create!(proyecto_hash)
  end
end

def proveedor_from_csv(row)
  if (row[11] =~ /\S/)
    {nombre: row[11]}
  end  
end

def create_proveedor_from_csv(row)
  proveedor_hash = proveedor_from_csv(row)
  if proveedor_hash
    proveedor = Proveedor.find_by(proveedor_hash)
    if not proveedor
      proveedor = Proveedor.create!(proveedor_hash)
    end
    return proveedor
  end
  return nil
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

def ficha_from_cvs(row)
  pc_soluciones = precio_reader(row[14])
  if not /\S+/.match(pc_soluciones)
    pc_soluciones = (precio_reader(row[15]).to_d/1.25).to_s
  end
  unidad = row[23]
  if not /\S+/.match(unidad)
    unidad="UNIDAD"
  end
  {
    nombre: row[9], 
    codigo: row[8], 
    importancia: row[7], 
    pc_soluciones: pc_soluciones, 
    ddp_saema: precio_reader(row[21]),
    unidad: unidad
  }
end

def create_ficha_from_csv(row)
  ficha_hash = ficha_from_cvs(row)
  ficha = Ficha.find_by codigo: ficha_hash[:codigo]
  if not ficha
    ficha = Ficha.create!(ficha_hash)
    subfamilia = Subfamilia.find_by(nombre: row[6])
    ficha.subfamilias << subfamilia
  end
  return ficha
end

def ficha_proveedor_from_csv(row)
  precio = precio_reader(row[13])
  hash =  {nombre: row[10], codigo: row[12], precio: precio}
  if (hash[:nombre] =~ /\S+/) 
    hash
  elsif (hash[:codigo] =~ /\S+/) or (hash[:precio] =~ /\S+/)
    hash[:nombre] = row[9]    
    hash
  end
end

def create_ficha_proveedor_from_csv(row)
  hash = ficha_proveedor_from_csv(row)
  if hash
    proveedor = create_proveedor_from_csv(row)
    find_by = {nombre: hash[:nombre]}
    if proveedor
      find_by[:proveedor] = proveedor
    end
    ficha_proveedor = FichaProveedor.find_by(find_by)
    if not ficha_proveedor
      ficha_proveedor = FichaProveedor.new(hash)
      ficha_proveedor.proveedor = proveedor
      ficha = create_ficha_from_csv(row)
      ficha_proveedor.ficha = ficha
      ficha_proveedor.save
      puts ficha_proveedor
    end
    return ficha_proveedor
  end
end

def ubicacion_from_csv(row)
  {codigo: row[0], nombre: row[1], ciudad: row[2]}
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
