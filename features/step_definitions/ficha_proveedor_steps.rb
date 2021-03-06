# -*- coding: utf-8 -*-
Dado(/^tabla de proveedores:$/) do |table|
  table.hashes.each do |attributes|
    FactoryGirl.create(:proveedor, attributes)
  end
end

Entonces(/^se abre un formulario$/) do
  expect(page).to have_selector('form')
end

Cuando(/^relleno el campo "(.*?)" con "(.*?)"$/) do |elem, val|
  fill_in(elem, :with => val)
end

Cuando(/^presiono "(.*?)"$/) do |arg1|
  click_button arg1
end


Cuando(/^elijo opción "(.*?)" en el campo "(.*?)"$/) do |option, field|
  select(option, :from => field)
end
