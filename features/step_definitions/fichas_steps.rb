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

Entonces(/^aparece lista de "(.*?)[s]" que contiene enlace "(.*?)"$/) do |model, nombre_enlace|
  save_and_open_page
  expect(page).to have_link nombre_enlace
end

Cuando(/^hago click  en "(.*?)"$/) do |nombre_enlace|
  click_link nombre_enlace
end

Entonces(/^aparece la ficha de material con titulo "(.*?)"$/) do |nombre_titulo|
  expect(find('h1')).to have_content(nombre_titulo)
end
