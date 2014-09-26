class Proveedor < ActiveRecord::Base
  validates :nombre, presence: true, uniqueness: true

  def to_s
    self.nombre
  end
end
