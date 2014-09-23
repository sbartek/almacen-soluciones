class Subfamilia < ActiveRecord::Base
  belongs_to :familia
  has_and_belongs_to_many :fichas

  def nombre_completo
    "#{self.nombre}/#{self.familia.nombre}/#{self.familia.negocio_unidad.nombre}"
  end
end
