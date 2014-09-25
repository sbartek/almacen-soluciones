# -*- coding: utf-8 -*-
class Solicitud < ActiveRecord::Base
  CATEGORIAS = [["Obra", "O"], ["Administación", "A"]]
  PRIORIDADES = [["Normal", "N"], ["Urgente", "U"]]

  belongs_to :proyecto
  belongs_to :usuario

  validates :categoria, presence: true, inclusion: CATEGORIAS.map{|c| c[1]}
  validates :prioridad, presence: true, inclusion: PRIORIDADES.map{|p| p[1]}
end
