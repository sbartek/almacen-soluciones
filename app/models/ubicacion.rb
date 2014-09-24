class Ubicacion < ActiveRecord::Base
  has_many :materials

  def to_s
    self.codigo+": "+self.nombre
  end

end
