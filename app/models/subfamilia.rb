class Subfamilia < ActiveRecord::Base
  belongs_to :familia
  has_and_belongs_to_many :fichas
end
