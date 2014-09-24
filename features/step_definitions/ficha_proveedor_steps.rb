Entonces(/^se abre un formulario$/) do
  expect(page).to have_selector('form')
end

Cuando(/^relleno el campo "(.*?)" con "(.*?)"$/) do |elem, val|
  fill_in(elem, :with => val)
end

Cuando(/^presiono "(.*?)"$/) do |arg1|
  click_button arg1
end

Entonces(/^vuelvo a la pagina de la ficha "(.*?)"$/) do |nombre_ficha|
  expect(find('h4')).to have_content(nombre_ficha)
end


