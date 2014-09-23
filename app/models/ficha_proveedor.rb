class FichaProveedor < ActiveRecord::Base
  belongs_to :ficha
  belongs_to :proveedor
  validates :nombre, presence: true

  def to_s
    rep = ""
    if self.codigo
      rep += self.codigo + ": "
    end
    rep += self.nombre
  end
end
