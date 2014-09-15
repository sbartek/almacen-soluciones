class Ficha < ActiveRecord::Base
  has_many :materials

  def cantidad_total
    self.materials.inject(0) { |sum, mat| sum+mat.cantidad}  
  end

end
