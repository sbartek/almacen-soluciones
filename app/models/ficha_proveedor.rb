class FichaProveedor < ActiveRecord::Base
  belongs_to :ficha
  belongs_to :proveedor
  validates :nombre, presence: true

  def proveedor_precio
    rep = ""
    if self.proveedor
      rep += "#{self.proveedor}: " 
    end
    if self.codigo
      rep += self.codigo + ": "
    end
    if self.precio
      rep += self.precio
    end
    if rep == ""
      rep += self.nombre
    end
    return rep
  end

  def to_s
    rep = ""
    if self.proveedor
      rep += "#{self.proveedor}: " 
    end
    if self.codigo
      rep += self.codigo + ": "
    end
    rep += self.nombre
  end
end
