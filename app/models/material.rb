class Material < ActiveRecord::Base
  belongs_to :ficha
  belongs_to :ubicacion
end
