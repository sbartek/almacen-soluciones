class Ficha < ActiveRecord::Base
  include PrecioHelper

  has_many :materials
  has_many :ficha_proveedors
  has_and_belongs_to_many :subfamilias

  def cantidad_total
    self.materials.inject(0) { |sum, mat| sum+ (mat.cantidad||0)}  
  end

  def to_s
    self.codigo+": "+self.nombre
  end

  def self.to_csv(options = {} )
    CSV.generate(options) do |csv|
      nombres = Ficha.column_names 
      nombres += ["cantidad total", "codigo de ubicacion", "nombre de ubicacion", "cantidad"]
      csv << nombres 
      Ficha.all.each do |ficha|
        attrs = ficha.attributes.values_at(*Ficha.column_names)
        attrs += [ficha.cantidad_total]
        ficha.materials.each do |material| 
          attrs += [material.ubicacion.codigo, material.ubicacion.codigo, material.cantidad]
          csv << attrs
        end
      end
    end
  end

end
