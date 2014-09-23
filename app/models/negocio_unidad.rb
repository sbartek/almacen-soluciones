class NegocioUnidad < ActiveRecord::Base
  has_many :familias
  validates :nombre, presence: true
end
