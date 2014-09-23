class Ficha < ActiveRecord::Base
  has_many :materials
  has_many :ficha_proveedor
  has_and_belongs_to_many :subfamilias

  def cantidad_total
    self.materials.inject(0) { |sum, mat| sum+mat.cantidad}  
  end

  def to_s
    self.codigo+": "+self.nombre
  end
end
