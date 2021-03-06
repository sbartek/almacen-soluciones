# -*- coding: utf-8 -*-
Dado(/^tabla de "?unidades de negocio"?:$/) do |table|
  table.hashes.each do |attributes|
    negocio_unidad = NegocioUnidad.find_by(nombre: attributes[:nombre])
    if not negocio_unidad
      FactoryGirl.create(:negocio_unidad, attributes)
    end
  end
end

Dado(/^tabla de "?familias"?:$/) do |table|
  table.hashes.each do |attributes|
    negocio_unidad_nombre = attributes[:negocio_unidad]
    negocio_unidad = NegocioUnidad.find_by(nombre: negocio_unidad_nombre)
    if not negocio_unidad
      negocio_unidad = FactoryGirl.create(:negocio_unidad, {nombre: attributes[:negocio_unidad]})
    end
    familia = FactoryGirl.create(:familia, {
                         nombre: attributes[:nombre],
                         negocio_unidad: negocio_unidad
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


Entonces(/^aparezca una lista de enlaces de subfamilias que contiene una fila que contine "(.*?)", "(.*?)", "(.*?)"$/) do |arg1, arg2, arg3|
  expect(page).to have_content(arg1)
  
#  save_and_open_page
  expect(page).to have_content(arg2)
  expect(page).to have_content(arg3)
end

