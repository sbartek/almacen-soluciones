class Subfamilia < ActiveRecord::Base
  belongs_to :familia
  has_and_belongs_to_many :fichas
  validates :nombre, presence: true
  validates_associated :familia
  validates_presence_of :familia

  def nombre_completo
    rep = "#{self.nombre} / "
    if self.familia
      rep += "#{self.familia.nombre} / "
      if self.familia.negocio_unidad
        rep += "#{self.familia.negocio_unidad.nombre}"
      end
    else
      rep += "NO TIENE FAMILIA"
    end
  end
end
