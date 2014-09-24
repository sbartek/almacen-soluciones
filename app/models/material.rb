class Material < ActiveRecord::Base
  belongs_to :ficha
  belongs_to :ubicacion
  belongs_to :proyecto
  validates :cantidad, presence: true
  validates_associated :ficha
  validates_presence_of :ficha
end
