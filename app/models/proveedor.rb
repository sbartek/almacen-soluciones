class Proveedor < ActiveRecord::Base
  validates :nombre, presence: true

  def to_s
    self.nombre
  end
end
