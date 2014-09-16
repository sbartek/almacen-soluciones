# -*- coding: utf-8 -*-
Dado(/^tabla de "?unidades de negocio"?:$/) do |table|
  table.hashes.each do |attributes|
    FactoryGirl.create(:negocio_unidad, attributes)
  end
end

Dado(/^tabla de "?familias"?:$/) do |table|
  table.hashes.each do |attributes|
    FactoryGirl.create(:familia, {
                         nombre: attributes[:nombre],
                         negocio_unidad: FactoryGirl.create(:negocio_unidad, {nombre: attributes[:negocio_unidad]})
                       })
  end
end

Dado(/^tabla de "?subfamilias"?:$/) do |table|
  table.hashes.each do |attributes|
    familia_nombre = attributes[:familia]
    familia = Familia.find_by(nombre: familia_nombre)
    if not familia
      familia =  FactoryGirl.create(:familia, {nombre: familia_nombre})
    end
    FactoryGirl.create(:subfamilia, {
                        nombre: attributes[:nombre],
                        familia: familia
                      })
  end
end
