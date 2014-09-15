# -*- coding: utf-8 -*-
Dado(/^tabla de ubicaciones:$/) do |table|
  table.hashes.each do |attributes|
    FactoryGirl.create(:ubicacion, attributes)
  end
end

Dado(/^tabla de materiales:$/) do |table|
  table.hashes.each do |attributes|
    material = Material.new
    material.ficha = Ficha.find_by nombre: attributes["nombre"]
    material.ubicacion = Ubicacion.find_by codigo: attributes["contenedor"]
    material.cantidad = attributes["cantidad"] 
    material.save
  end
end
