# -*- coding: utf-8 -*-
Dado(/^tabla de fichas:$/) do |table|
  table.hashes.each do |attributes|
    FactoryGirl.create(:ficha, attributes)
  end
end

Cuando(/^hago click en el enlace "(.*?)" de la pagina inicial$/) do |nombre_enlace|
  visit '/'
  click_link nombre_enlace
end

Entonces(/^aparece lista ?"?(.*?)"? de "(.*?)[s]" que contiene enlace "(.*?)"$/) do |titulo_lista, model, nombre_enlace|
  expect(page).to have_content(titulo_lista)
  expect(page).to have_link nombre_enlace
end

Cuando(/^hago click  en "(.*?)"$/) do |nombre_enlace|
  click_link nombre_enlace
end

Entonces(/^aparece la ficha de material con titulo "(.*?)"$/) do |nombre_ficha|
  expect(find('h1')).to have_content(nombre_ficha)
end

Cuando(/^entro la pagina de la ficha "(.*?)"$/) do |nombre_ficha|
  visit '/'
  click_link "Lista de materiales"
  click_link nombre_ficha
end

Entonces(/^la cantidad total de "(.*?)"$/) do |numero|
  expect(page).to have_content("Cantidad total")
  expect(page).to have_content(numero)
end

Dado(/^material "(.*?)" en contenedor con nombre "(.*?)"$/) do |nombre_ficha, nombre_contenedor|
  FactoryGirl.create(:material, {
                       ficha: Ficha.find_by(nombre: nombre_ficha),
                       ubicacion: Ubicacion.find_by(nombre: nombre_contenedor) })
end

Entonces(/^en la lista "Stock" aparezca una entrada cuyo almacen no tiene codigo$/) do 
  pending # express the regexp above with the code you wish you had
end
