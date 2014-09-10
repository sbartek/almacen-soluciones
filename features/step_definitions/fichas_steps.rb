# -*- coding: utf-8 -*-
Dado(/^tabla de fichas:$/) do |table|
  Ficha.create!(table.hashes)
end

Cuando(/^hago click en el enlace "(.*?)" de la pagina inicial$/) do |nombre_enlace|
  visit '/'
  click_link 'nombre_enlace'
end

Entonces(/^aparece lista de fichas que contiene enlace "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Cuando(/^hago click  en "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Entonces(/^aparece la ficha de material con titulo "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end
