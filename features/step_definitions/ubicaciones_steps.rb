# -*- coding: utf-8 -*-
Dado(/^tabla de ubicaciones:$/) do |table|
  table.hashes.each do |attributes|
    FactoryGirl.create(:ubicacion, attributes)
  end
end

Dado(/^tabla de materiales:$/) do |table|
  table.hashes.each do |attributes|
    FactoryGirl.create(:material, {
                         ficha: Ficha.find_by(nombre: attributes["nombre"]),
                         ubicacion: Ubicacion.find_by(codigo: attributes["contenedor"]),
                         cantidad: attributes["cantidad"]}) 
  end
end
