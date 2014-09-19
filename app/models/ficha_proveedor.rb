class FichaProveedor < ActiveRecord::Base
  belongs_to :ficha
  belongs_to :proveedor
  validates :nombre, presence: true
end
