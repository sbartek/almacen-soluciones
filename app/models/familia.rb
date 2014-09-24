class Familia < ActiveRecord::Base
  belongs_to :negocio_unidad
  has_many :subfamilias

  validates :nombre, presence: true
  validates_associated :negocio_unidad
  validates_presence_of :negocio_unidad

  def to_s 
    ret = ""
    if not self.nombre
      ret += "NO TIENE NOMBRE / "
    else
      ret = "#{self.nombre} / "
    end
    if not self.negocio_unidad
      ret += "NO TIENE UNDAD DE NEGOCIO"
    else
      ret += "#{self.negocio_unidad}"
    end
  end
end
