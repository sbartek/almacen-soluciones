class Familia < ActiveRecord::Base
  belongs_to :negocio_unidad
  has_many :subfamilias
end
