class NegocioUnidad < ActiveRecord::Base
  has_many :familias
  validates :nombre, presence: true

  def to_s 
    ret = ""
    if not self.nombre
      ret += "NO TIENE NOMBRE DE UNIDAD"
    else
      ret = "#{self.nombre}"
    end
    return ret
  end

end
