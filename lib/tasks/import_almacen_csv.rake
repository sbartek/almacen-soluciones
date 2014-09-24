require 'csv'
desc "Imports a CSV file into an ActiveRecord table"
task :import_almacen_csv, [:filename] => :environment do
  line_number = 2
  CSV.foreach('db/STOCKSAEMA2014V4PRUEBA.csv', :headers => true) do |row|
    if line_number != 1
      puts "Numero de linea: #{line_number}"
      get_or_create_proyecto_from_csv(row)
      get_or_create_proveedor_from_csv(row)
      create_negocio_unidad_from_csv(row)    
      create_familia_from_csv(row)
      create_subfamilia_from_csv(row)
      get_or_create_ficha_from_csv(row)
      create_ficha_proveedor_from_csv(row)
      create_ubicacion_from_csv(row)      
      get_or_create_material_from_csv(row)
      line_number += 1
    end
  end
end

def precio_reader(precio)
  num = /(?:\d+.)?\d*(?:,\d\d?)?/.match(precio)
  num_s = num.to_s
  num_s.gsub!(/\./,'')
  num_s.gsub!(/,/,'.')
  if num_s
    return num_s
  end
  return nil
end

def proyecto_from_csv(row)
  if row[3]
    {nombre: row[3]}
  end
end

def get_or_create_proyecto_from_csv(row)
  proyecto_hash = proyecto_from_csv(row)
  if proyecto_hash
    proyecto = Proyecto.find_by(proyecto_hash)
    if not proyecto
      proyecto = Proyecto.create!(proyecto_hash)
      puts proyecto.to_s
    end
    return proyecto
  end
  return nil
end

def proveedor_from_csv(row)
  if (row[11] =~ /\S/)
    {nombre: row[11]}
  end  
end

def get_or_create_proveedor_from_csv(row)
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
  if row[4]
    {nombre: row[4]}
  end
end

def create_negocio_unidad_from_csv(row)
  hash = negocio_unidad_from_csv(row)
  if hash
    unidad = NegocioUnidad.find_by(hash)
    if not unidad
      unidad = NegocioUnidad.create!(hash)
      puts unidad.to_s
    end
    return unidad
  end
  return nil
end

def familia_from_csv(row)
  if row[4]
    unidad = NegocioUnidad.find_by(nombre: row[4])
    {nombre: row[5], negocio_unidad: unidad}
  end
end

def create_familia_from_csv(row)
  hash = familia_from_csv(row)
  if hash
    familia = Familia.find_by(hash)
    if not familia
      familia = Familia.create!(hash)
      puts familia.to_s
    end
    return familia
  end
  return nil
end

def subfamilia_from_csv(row)
  if row[6]
    familia = Familia.find_by(nombre: row[5])
    return {nombre: row[6], familia: familia}
  end
end

def create_subfamilia_from_csv(row)
  hash = subfamilia_from_csv(row)
  if hash
    subfamilia = Subfamilia.find_by(hash)
    if not subfamilia
      subfamilia = Subfamilia.create!(hash)
      puts subfamilia.to_s
    end
    return subfamilia
  end
  return nil
end

def ficha_from_cvs(row)
  pc_soluciones = precio_reader(row[14])
  if not /\S+/.match(pc_soluciones)
    pc_soluciones = (precio_reader(row[15]).to_d/1.25).to_s
  end
  unidad = row[24]
  if not unidad
    unidad="UNIDAD"
  end
  if row[9] and row[8]
    return   {
      nombre: row[9], 
      codigo: row[8], 
      importancia: row[7], 
      pc_soluciones: pc_soluciones, 
      ddp_saema: precio_reader(row[21]),
      unidad: unidad
    }
  end
  return nil
end

def get_or_create_ficha_from_csv(row)
  ficha_hash = ficha_from_cvs(row)
  if ficha_hash
    ficha = Ficha.find_by codigo: ficha_hash[:codigo]
    if not ficha
      ficha = Ficha.create!(ficha_hash)
      subfamilia =  create_subfamilia_from_csv(row)
      if subfamilia
        ficha.subfamilias << subfamilia
      end
      puts ficha.to_s
    end
    return ficha
  end
  return nil
end

def ficha_proveedor_from_csv(row)
  if (row[10] or row[9])
    if row[10]
      hash =  {nombre: row[10]}
    else
      hash =  {nombre: row[9]}
    end
    hash[:codigo] = row[12]
    precio = precio_reader(row[13])
    if precio
      hash[:precio] = precio
    end
    return hash
  end
  return nil
end

def create_ficha_proveedor_from_csv(row)
  hash = ficha_proveedor_from_csv(row)
  if hash
    proveedor = get_or_create_proveedor_from_csv(row)
    find_by = {nombre: hash[:nombre]}
    if proveedor
      find_by[:proveedor] = proveedor
    end
    ficha_proveedor = FichaProveedor.find_by(find_by)
    if not ficha_proveedor
      ficha_proveedor = FichaProveedor.new(hash)
      ficha_proveedor.proveedor = proveedor
      ficha = get_or_create_ficha_from_csv(row)
      ficha_proveedor.ficha = ficha
      ficha_proveedor.save
      puts ficha_proveedor.to_s
    end
    return ficha_proveedor
  end
end

def ubicacion_from_csv(row)
  if row[0] 
    {codigo: row[0], nombre: row[1], ciudad: row[2]}
  end
end

def create_ubicacion_from_csv(row)
  hash = ubicacion_from_csv(row)
  if hash
    ubi = Ubicacion.find_by codigo: hash[:codigo]
    if not ubi
      ubi = Ubicacion.create!(hash)
      puts ubi.to_s
    end
    return ubi
  end
  return nil
end
  
def material_from_cvs(row)
  ubi = Ubicacion.find_by codigo: row[0]
  ficha = Ficha.find_by codigo: row[8]
  {ubicacion: ubi, ficha: ficha, cantidad:row[25]}
end

def get_or_create_material_from_csv(row)
  hash = material_from_cvs(row)
  mat = nil
  if hash
    mat = find_material_in_db(hash)
    if not mat
      mat = Material.new
      mat.ubicacion = hash[:ubicacion] 
      mat.ficha = hash[:ficha]
      mat[:cantidad] = hash[:cantidad]
      proyecto = get_or_create_proyecto_from_csv(row)
      mat.proyecto = proyecto if proyecto
      mat.save
    end
  end
  return mat
end

def find_material_in_db(mat_hash)
  if mat_hash[:ficha]
    mat_hash[:ficha].materials.each do |mat|
      if mat.ubicacion == mat_hash[:ubicacion]
        return mat
      end
    end
  end
  return nil
end
