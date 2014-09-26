# -*- coding: utf-8 -*-


class Solicitud < ActiveRecord::Base
  validates :usuario, presence: true
  validates :proyecto, presence: true
  validates :descripcion, presence: true, length: {minimum: 11, maximum: 1200}

  CATEGORIAS = [["Obra", "O"], ["Administación", "A"]]
  PRIORIDADES = [["Normal", "N"], ["Urgente", "U"]]

  belongs_to :proyecto
  belongs_to :usuario

  validates :categoria, presence: true, inclusion: CATEGORIAS.map{|c| c[1]}
  validates :prioridad, presence: true, inclusion: PRIORIDADES.map{|p| p[1]}

  def optiones_to_hash(optiones)
    optiones.map{|o| [o[1], o[0]]}.to_h
  end

  def categoria_full
    self.optiones_to_hash(CATEGORIAS)[self.categoria]
  end

  def prioridad_full
    self.optiones_to_hash(PRIORIDADES)[self.prioridad]
  end

  def nr_ref
    "#{self.id}/#{self.fecha.year}"
  end
end
