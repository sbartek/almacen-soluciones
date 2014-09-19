class Proveedor < ActiveRecord::Base
  validates :nombre, presence: true
end
