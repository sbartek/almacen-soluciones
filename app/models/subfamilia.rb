class Subfamilia < ActiveRecord::Base
  belongs_to :familia
  has_and_belongs_to_many :fichas
  validates :nombre, presence: true
  validates_associated :familia
  validates_presence_of :familia

  def to_s
    rep = "#{self.nombre} / "
    if self.familia
      rep += "#{self.familia.to_s}"
    else
      rep += "NO TIENE FAMILIA"
    end
  end

  def negocio_unidad
    familia.negocio_unidad if familia
  end
end
